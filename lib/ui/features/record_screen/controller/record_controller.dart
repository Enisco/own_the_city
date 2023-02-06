import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:own_the_city/app/helpers/sharedprefs.dart';
import 'package:own_the_city/app/resources/app.logger.dart';
import 'package:own_the_city/app/services/snackbar_service.dart';
import 'package:own_the_city/ui/features/record_screen/model/record_model.dart';
import 'package:own_the_city/ui/shared/global_variables.dart';
import 'package:own_the_city/utils/app_constants/app_colors.dart';

var log = getLogger('RecordPageView');

enum ToponymTypes { Natural, Artificial }

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';

class RecordToponymController extends GetxController {
  RecordToponymController();

  bool showLoading = false;

  TextEditingController toponymNameController = TextEditingController();
  TextEditingController toponymDescriptionController = TextEditingController();
  TextEditingController toponymYearController = TextEditingController();

  var selectedToponymTypes = ToponymTypes.Natural;

  List<XFile> imageFilesSelected = [];
  int selectedImageIndex = 0;
  String? recordToponymId;

  String generateRandomrecordToponymId() {
    Random random = Random();
    int randomNumber1 = random.nextInt(10000);
    int randomNumber2 = random.nextInt(99999);
    recordToponymId = GlobalVariables.myUsername.toString() +
        randomNumber1.toString() +
        randomNumber2.toString();
    update();
    print("GeneratedRandomRecordToponymId: $recordToponymId");
    return recordToponymId!;
  }

  String formatCurrentTime() {
    DateTime now = DateTime.now();
    String lastTime =
        "${DateFormat.yMMMEd().format(now)} ${DateFormat.jm().format(DateTime.now())}";
    print(lastTime);
    return lastTime;
  }

  void changeSelectedImageIndex(int selectedPickIndex) {
    selectedImageIndex = selectedPickIndex;
    update();
  }

  /// Upload image from gallery
  uploadfromGallery() async {
    List<XFile> selectedImages = await ImagePicker().pickMultiImage(
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (selectedImages.isNotEmpty) {
      if (selectedImages.length > 4) {
        selectedImages = [
          selectedImages[0],
          selectedImages[1],
          selectedImages[2],
          selectedImages[3],
        ];
      }

      imageFilesSelected.addAll(selectedImages);
      update();
      print("Image List Length:${imageFilesSelected.length}");
    } else {
      print("No Image selected");
    }
    print("Returning");
  }

  /// Snap image with Camera
  captureFromCamera() async {
    XFile? capturedImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (capturedImage != null) {
      imageFilesSelected.add(capturedImage);
      update();
    } else {
      print("No Image selected");
    }
    print("Returning");
  }

  Future<void> uploadRecordToponymData(BuildContext context) async {
    if (toponymNameController.text.trim().isNotEmpty &&
        toponymDescriptionController.text.trim().isNotEmpty &&
        imageFilesSelected.isNotEmpty) {
      showLoading = true;
      update();
      recordToponymId = generateRandomrecordToponymId();

      /// Upload image to cloud storage
      final firebaseStorage = FirebaseStorage.instance;
      List<String> downloadUrls = [];

      for (int index = 0; index < 4; index++) {
        var snapshot = await firebaseStorage
            .ref()
            .child('own_the_city/$recordToponymId/${index + 1}')
            .putFile(File(imageFilesSelected[index].path))
            .whenComplete(() => print("Uploaded image ${index + 1}"));

        /// Generate download links
        var downloadUrl = await snapshot.ref.getDownloadURL();
        downloadUrls.add(downloadUrl);
      }
      log.w("downloadUrls: $downloadUrls");
      update();

      String dateString = formatCurrentTime();
      log.wtf("dateString: $dateString");

      /// get saved profileImageLink
      String myProfileImageLink =
          await getSharedPrefsSavedString("profileImageLink");

      /// Map data
      RecordToponymModel toponymData = RecordToponymModel(
        username: GlobalVariables.myUsername,
        thumbsUp: 0,
        feedCoverPictureLink: downloadUrls,
        feedName: toponymNameController.text.trim(),
        feedDescription: toponymDescriptionController.text.trim(),
        userProfilePicsLink: myProfileImageLink,
        dateCreated: dateString,
        toponymType: selectedToponymTypes.name,
      );

      print('toponymData to be uploaded: ${toponymData.toJson()}');

      /// Upload data to firestore
      DatabaseReference ref =
          FirebaseDatabase.instance.ref("toponym_data/$recordToponymId");

      print(toponymData.toJson());

      await ref
          .set(toponymData.toJson())
          .whenComplete(
            () => showCustomSnackBar(
              context,
              "Voila! Toponym recorded",
              () {},
              Colors.green,
              1000,
            ),
          )
          .whenComplete(() {
        showLoading = false;
        context.pop();
      });
    } else {
      showCustomSnackBar(context, "Ensure all fields are filled", () {},
          AppColors.coolRed, 1000);
    }
  }
}
