import 'package:flutter/material.dart';
import 'package:own_the_city/ui/features/record_screen/model/record_model.dart';
import 'package:provider/provider.dart';

class CameraCaptureController with ChangeNotifier {
  TextEditingController phoneNumberController = TextEditingController();
  CameraCaptureController();

  void uploadfromGallery(BuildContext context) {
    RecordToponymModel recordToponymModel =
        Provider.of<RecordToponymModel>(context, listen: false);

    recordToponymModel.getFromGallery();
  }

  void captureFromCamera(BuildContext context) {
    RecordToponymModel recordToponymModel =
        Provider.of<RecordToponymModel>(context, listen: false);

    recordToponymModel.getFromCamera();
  }

  void uploadDataToFB(BuildContext context) {
    RecordToponymModel recordToponymModel =
        Provider.of<RecordToponymModel>(context, listen: false);

    recordToponymModel.uploadData(context);
  }

  void changeSelectedImage(BuildContext context, selectedImageIndex) {
    RecordToponymModel recordToponymModel =
        Provider.of<RecordToponymModel>(context, listen: false);

    recordToponymModel.changeSelectedImageIndex(selectedImageIndex);
  }

  void updateVals(BuildContext context) {
    RecordToponymModel recordToponymModel =
        Provider.of<RecordToponymModel>(context, listen: false);

    recordToponymModel.updateVals();
  }
}
