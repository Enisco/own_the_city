// ignore_for_file: use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:go_router/go_router.dart';
import 'package:own_the_city/app/services/snackbar_service.dart';
import 'package:own_the_city/ui/create_account/create_account_model/create_account_model.dart';
import 'package:own_the_city/ui/shared/global_variables.dart';

class CreateUserController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  CreateUserController();

  bool showLoading = false;
  String errMessage = '', userExisting = ' ';

  void resetValues() {
    errMessage = "";
    showLoading = false;
    update();
  }

  void gotoSignInUserPage(BuildContext context) {
    print('Going to sign in user page');
    resetValues();
    context.push('/signInUserView');
  }

  void gotoHomepage(BuildContext context) {
    GlobalVariables.myUsername = usernameController.text.trim();
    print("GlobalVariables.myUsername: ${GlobalVariables.myUsername}");
    print('Going to homepage page');
    resetValues();
    context.go('/homepageView');
  }

  void attemptToSignInUser(BuildContext context) {
    print('attemptToSignInUser . . .');
    errMessage = '';

    if (usernameController.text.trim().isNotEmpty &&
        !usernameController.text.trim().contains(" ") &&
        passwordController.text.trim().isNotEmpty &&
        !passwordController.text.trim().contains(" ")) {
      print('signing in user . . .');
      showLoading = true;
      errMessage = '';
      update();
      checkIfUserExistsForSignIn(context);
    } else {
      errMessage = 'All fields must be filled, and with no spaces';
      print("Errormessage: $errMessage");
      showLoading = false;
      update();
    }
  }

  Future<void> checkIfUserExistsForSignIn(BuildContext context) async {
    print('checking If User Exists');
    final ref = FirebaseDatabase.instance.ref();
    final snapshot =
        await ref.child('user_details/${usernameController.text.trim()}').get();
    if (snapshot.exists) {
      print("User exists: ${snapshot.value}");
      UserAccountModel userAccountModel =
          userAccountModelFromJson(jsonEncode(snapshot.value).toString());
      print(
          "UserAccountModel: ${userAccountModel.toJson()} \nPassword Existing: ${userAccountModel.password}");
      if (userAccountModel.password == passwordController.text.trim()) {
        showLoading = false;
        update();
        gotoHomepage(context);
      } else {
        print('Password does not match.');
        errMessage = "Error! username or password incorrect";
        showLoading = false;
        update();
      }
    } else {
      print('User data does not exist.');
      errMessage = "Error! User ${usernameController.text.trim()} not found";
      showLoading = false;
      update();
    }
  }

  void attemptToRegisterUser(BuildContext context) {
    print('attemptToRegisterUser . . .');
    errMessage = '';
    showLoading = true;
    update();

    if (usernameController.text.trim().isNotEmpty &&
        !usernameController.text.trim().contains(" ") &&
        passwordController.text.trim().isNotEmpty &&
        !passwordController.text.trim().contains(" ")) {
      print('Registering user . . .');
      showLoading = true;
      errMessage = '';
      update();
      checkIfUserExistsForCreateAccount(context);
    } else {
      errMessage = 'All fields must be filled, and with no spaces';
      print("Errormessage: $errMessage");
      showLoading = false;
      update();
    }
  }

  Future<void> checkIfUserExistsForCreateAccount(BuildContext context) async {
    print('checking If User Exists');
    final ref = FirebaseDatabase.instance.ref();
    final snapshot =
        await ref.child('user_details/${usernameController.text.trim()}').get();
    if (snapshot.exists) {
      print("User exists: ${snapshot.value}");
      UserAccountModel userAccountModel =
          userAccountModelFromJson(jsonEncode(snapshot.value).toString());
      print(
          "UserAccountModel: ${userAccountModel.toJson()} \nUsername: ${userAccountModel.username}");

      userExisting = usernameController.text.trim();
      showLoading = false;
      update();
      context.push('/signInExistingUserView');
    } else {
      print('User does not exist. Creating new user . . .');
      registerUser(context);
    }
  }

  Future<void> registerUser(BuildContext context) async {
    UserAccountModel createAccountData = UserAccountModel()
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
        .whenComplete(() => gotoHomepage(context));
  }
}
