import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:own_the_city/ui/features/record_screen/model/record_model.dart';
import 'package:own_the_city/ui/shared/global_variables.dart';

enum ToponymTypes { Natural, Artificial }

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';

class RecordToponymController extends GetxController {
  RecordToponymController();

  TextEditingController toponymController = TextEditingController();
  TextEditingController toponymDescriptionController = TextEditingController();
  TextEditingController toponymYearController = TextEditingController();

  List<XFile> imageFilesSelected = [];
  int selectedImageIndex = 0;
  String? toponymId;

  String generateRandomToponymId() {
    Random random = Random();
    int randomNumber1 = random.nextInt(10000);
    int randomNumber2 = random.nextInt(99999);
    toponymId = GlobalVariables.myUsername.toString() +
        randomNumber1.toString() +
        randomNumber2.toString();
    update();
    print("generateRandomToponymId: $toponymId");
    return toponymId!;
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

  /// get current location
  Future<String> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    print('Position determined: $position');

    return position.toString();
  }

  Future<void> uploadData(BuildContext context) async {
    String currentLocation = await _determinePosition();
    print('Position coordinates: $currentLocation');

    toponymId = generateRandomToponymId();

    /// Upload image to cloud storage
    final firebaseStorage = FirebaseStorage.instance;
    List downloadUrls = <String>[];

    for (int index = 0; index < 4; index++) {
      var snapshot = await firebaseStorage
          .ref()
          .child('own_the_city/$toponymId/$index')
          .putFile(File(imageFilesSelected[index].path))
          .whenComplete(() => print("Uploaded image $index"));

      /// Generate download links
      var downloadUrl = await snapshot.ref.getDownloadURL();
      downloadUrls.add(downloadUrl);
    }
    update();

    String dateString = formatCurrentTime();

    /// Map data
    // RecordToponymModel toponymData = RecordToponymModel(username: username, thumbsUp: thumbsUp, feedCoverPictureLink: feedCoverPictureLink, feedName: feedName, feedDescription: feedDescription, userProfilePicsLink: userProfilePicsLink, dateCreated: dateCreated, toponymType: toponymType)

    // print('Data to be uploaded: $data');

    // /// Upload data to firestore

    // DatabaseReference ref = FirebaseDatabase.instance
    //     .ref("user_details/${createAccountData.username}");
    ///
  }
}
