import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:own_the_city/app/helpers/sharedprefs.dart';
import 'package:own_the_city/app/resources/app.logger.dart';
import 'package:own_the_city/ui/create_account/create_account_model/create_account_model.dart';
import 'package:own_the_city/ui/shared/global_variables.dart';

var log = getLogger('ProfileController');

class ProfileController extends GetxController {
  ProfileController();

  bool detailsLoaded = false;
  String profileImageLink = ' ';
  UserAccountModel myAccountData = UserAccountModel();

  getMyProfileData() async {
    await retrieveSavedProfileImageLink();
    await getMyProfileDataFromDb();
    // update();
    // update();
  }

  retrieveSavedProfileImageLink() async {
    String link = await getSharedPrefsSavedString("profileImageLink");
    profileImageLink = link;
    update();
  }

  Future<void> getMyProfileDataFromDb() async {
    final getDataRef = FirebaseDatabase.instance.ref();
    final getDataSnapshot = await getDataRef
        .child('user_details/${GlobalVariables.myUsername}')
        .get();

    if (getDataSnapshot.exists) {
      print("User exists: ${getDataSnapshot.value}");

      UserAccountModel userAccountModel = userAccountModelFromJson(
          jsonEncode(getDataSnapshot.value).toString());
      myAccountData = userAccountModel;
      detailsLoaded = true;
      update();
    }
  }
}
