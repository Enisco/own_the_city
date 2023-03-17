// ignore_for_file: must_be_immutable

import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:own_the_city/ui/features/create_account/create_account_controller/create_account_controller.dart';
import 'package:own_the_city/ui/shared/custom_button.dart';
import 'package:own_the_city/ui/shared/custom_textfield_.dart';
import 'package:own_the_city/ui/shared/spacer.dart';
import 'package:own_the_city/utils/app_constants/app_colors.dart';
import 'package:own_the_city/utils/app_constants/app_styles.dart';
import 'package:own_the_city/utils/screen_util/screen_util.dart';

class SignInUserView extends StatelessWidget {
  SignInUserView({super.key});

  final controller = Get.put(CreateUserController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.plainWhite,
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        title: const Text(
          "Sign In",
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
              CustomTextfield(
                textEditingController: controller.usernameController,
                labelText: 'Username',
                hintText: 'Enter your preferred username',
              ),
              CustomSpacer(20),
              CustomTextfield(
                textEditingController: controller.passwordController,
                labelText: 'Password',
                hintText: 'Enter your preferred password',
              ),
              CustomSpacer(20),
              Center(
                child: GetBuilder<CreateUserController>(
                    init: CreateUserController(),
                    builder: (_) {
                      return Text(
                        controller.errMessage,
                        style: const TextStyle(color: Colors.red),
                      );
                    }),
              ),
              CustomSpacer(40),
              CustomButton(
                styleBoolValue: true,
                height: 55,
                width: screenSize(context).width * 0.6,
                color: Colors.amber[600],
                child: Text(
                  'Sign in',
                  style: AppStyles.regularStringStyle(18, AppColors.plainWhite),
                ),
                onPressed: () {
                  SystemChannels.textInput.invokeMethod('TextInput.hide');
                  controller.attemptToSignInUser(context);
                },
              ),
              CustomSpacer(12),
              RichText(
                textScaleFactor: 1,
                text: TextSpan(
                  text: 'Don\'t have an account? ',
                  style: TextStyle(
                    color: AppColors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Sign up here',
                      style: AppStyles.regularStringStyle(
                        14,
                        AppColors.kPrimaryColor,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          controller.resetValues();
                          Navigator.pop(context);
                        },
                    ),
                  ],
                ),
              ),
              CustomSpacer(40),
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
