// ignore_for_file: use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:go_router/go_router.dart';
import 'package:own_the_city/app/services/snackbar_service.dart';
import 'package:own_the_city/ui/create_account/create_account_model/create_account_model.dart';

class CreateUserController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  CreateUserController();

  bool showLoading = false;
  String errMessage = '', userExisting = ' ';

  void gotoSignInPage(BuildContext context) {
    print('Going to sign in page');
    context.push('/signInExistingUserView');
  }

  void attemptToRegisterUser(BuildContext context) {
    print('attemptToRegisterUser . . .');
    errMessage = '';

    if (usernameController.text.trim().isNotEmpty &&
        !usernameController.text.trim().contains(" ") &&
        passwordController.text.trim().isNotEmpty &&
        !passwordController.text.trim().contains(" ")) {
      print('Registering user . . .');
      showLoading = true;
      errMessage = '';
      update();
      checkIfUserExists(context);
    } else {
      errMessage = 'All fields must be filled, and with no spaces';
      print("Errormessage: $errMessage");
      showLoading = false;
      update();
    }
  }

  Future<void> checkIfUserExists(BuildContext context) async {
    print('checking If User Exists');
    final ref = FirebaseDatabase.instance.ref();
    final snapshot =
        await ref.child('user_details/${usernameController.text.trim()}').get();
    if (snapshot.exists) {
      print("User exists: ${snapshot.value}");
      userExisting = usernameController.text.trim();
      showLoading = false;
      update();
      gotoSignInPage(context);
    } else {
      print('User does not exist. Creating new user . . .');
      registerUser(context);
    }
  }

  Future<void> registerUser(BuildContext context) async {
    CreateAccountModel createAccountData = CreateAccountModel()
      ..username = usernameController.text.trim()
      ..password = passwordController.text.trim();

    DatabaseReference ref = FirebaseDatabase.instance
        .ref("user_details/${createAccountData.username}");

    print(createAccountData.toJson());

    await ref
        .set(createAccountData.toJson())
        .whenComplete(
          () => showCustomSnackBar(
            context,
            "User ${usernameController.text.trim()} created",
            () {},
            Colors.green,
          ),
        )
        .whenComplete(() => context.go('/homepageView'));
  }
}
