// ignore_for_file: must_be_immutable

import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:own_the_city/ui/create_account/create_account_controller/create_account_controller.dart';
import 'package:own_the_city/ui/shared/custom_button.dart';
import 'package:own_the_city/ui/shared/custom_textfield%20copy.dart';
import 'package:own_the_city/ui/shared/spacer.dart';
import 'package:own_the_city/utils/app_constants/app_colors.dart';
import 'package:own_the_city/utils/app_constants/app_styles.dart';
import 'package:own_the_city/utils/screen_util/screen_util.dart';

class CreateAccountView extends StatelessWidget {
  CreateAccountView({super.key});

  final controller = Get.put(CreateUserController());
  bool check = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.plainWhite,
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        title: const Text(
          "Create Account",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SizedBox(
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              CustomSpacer(50),
              Center(
                child: CustomButton(
                  styleBoolValue: true,
                  width: screenSize(context).width * 0.5,
                  color: Colors.amber[600],
                  child: Text(
                    'Create Account',
                    style:
                        AppStyles.regularStringStyle(20, AppColors.plainWhite),
                  ),
                  onPressed: () {
                    controller.attemptToRegisterUser(context);
                  },
                ),
              ),
              CustomSpacer(50),
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
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
