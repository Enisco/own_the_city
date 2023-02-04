// ignore_for_file: use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateUserController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  CreateUserController();

  bool showLoading = false;
  String errMessage = '';

  void attemptToRegisterUser(BuildContext context) {
    print('attemptToRegisterUser user . . .');
    errMessage = '';

    if (usernameController.text.trim().isNotEmpty &&
        !usernameController.text.trim().contains(" ") &&
        passwordController.text.trim().isNotEmpty &&
        !passwordController.text.trim().contains(" ")) {
      print('Registering user . . .');
      errMessage = '';
      update();
      registerUser(
        context,
        usernameController.text.trim(),
      );
    } else {
      errMessage = 'All fields must be filled, and with no spaces';
      print("Errormessage: $errMessage");
      update();
    }
  }

  Future<void> registerUser(BuildContext context, String username) async {}
}
