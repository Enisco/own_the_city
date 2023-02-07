// ignore_for_file: must_be_immutable

import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:own_the_city/ui/features/create_account/create_account_controller/create_account_controller.dart';
import 'package:own_the_city/ui/shared/custom_button.dart';
import 'package:own_the_city/ui/shared/spacer.dart';
import 'package:own_the_city/utils/app_constants/app_colors.dart';
import 'package:own_the_city/utils/app_constants/app_styles.dart';
import 'package:own_the_city/utils/screen_util/screen_util.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';

class UpdateNewAccountView extends StatelessWidget {
  UpdateNewAccountView({super.key});

  final controller = Get.put(CreateUserController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.plainWhite,
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        title: const Text(
          "Set up your account",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: SizedBox(
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GetBuilder<CreateUserController>(
                  init: CreateUserController(),
                  builder: (_) {
                    return Column(
                      children: [
                        SelectState(
                          dropdownColor: AppColors.kPrimaryColor,
                          onCountryChanged: (countryValue) {
                            controller.countrySelected = countryValue;
                            controller.update();
                          },
                          onStateChanged: (stateValue) {
                            controller.stateSelected = stateValue;
                            controller.update();
                          },
                          onCityChanged: (cityValue) {
                            controller.citySelected = cityValue;
                            controller.update();
                          },
                        ),
                        CustomSpacer(20),
                        controller.imageFile != null
                            ? CircleAvatar(
                                radius: 80,
                                backgroundColor: AppColors.lighterGray,
                                backgroundImage:
                                    FileImage(controller.imageFile!),
                                // child: controller.imageFile != null
                                //     ? Image.file(
                                //         controller.imageFile!,
                                //         fit: BoxFit.cover,
                                //       )
                                //     : const SizedBox.shrink(),
                              )
                            : CircleAvatar(
                                radius: 80,
                                backgroundColor: AppColors.lighterGray,
                              ),
                        CustomSpacer(15),
                        ElevatedButton(
                          onPressed: () {
                            controller.getFromGallery();
                          },
                          child: Text(
                            controller.imageFile == null
                                ? "SELECT FROM GALLERY"
                                : "CHOOSE ANOTHER IMAGE",
                          ),
                        ),
                        CustomSpacer(10),
                        ElevatedButton(
                          onPressed: () {
                            controller.getFromCamera();
                          },
                          child: Text(
                            controller.imageFile == null
                                ? "CAPTURE WITH CAMERA"
                                : "CAPTURE ANOTHER IMAGE",
                          ),
                        ),
                        CustomSpacer(20),
                        Text(
                          controller.errMessage,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ],
                    );
                  }),
              CustomSpacer(20),
              CustomButton(
                styleBoolValue: true,
                height: 55,
                width: screenSize(context).width * 0.6,
                color: Colors.amber[600],
                child: Text(
                  'Continue',
                  style: AppStyles.regularStringStyle(18, AppColors.plainWhite),
                ),
                onPressed: () {
                  SystemChannels.textInput.invokeMethod('TextInput.hide');
                  controller.updateNewUserData(context);
                },
              ),
              CustomSpacer(10),
              GetBuilder<CreateUserController>(
                init: CreateUserController(),
                builder: (_) {
                  return Center(
                    child: controller.showLoading == true
                        ? Platform.isAndroid
                            ? const CircularProgressIndicator()
                            : const CupertinoActivityIndicator()
                        : const SizedBox.shrink(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
