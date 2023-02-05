import 'dart:io';

import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:own_the_city/app/resources/app.logger.dart';
import 'package:own_the_city/ui/features/custom_nav_bar/custom_navbar.dart';
import 'package:own_the_city/ui/features/homepage/views/widgets/homepage_body.dart';
import 'package:own_the_city/utils/app_constants/app_colors.dart';

var log = getLogger('HomepageView');

class HomepageView extends StatefulWidget {
  const HomepageView({super.key});

  @override
  State<HomepageView> createState() => _HomepageViewState();
}

class _HomepageViewState extends State<HomepageView> {
  @override
  void initState() {
    super.initState();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ConditionalWillPopScope(
        onWillPop: () async {
          if (Platform.isAndroid) {
            SystemNavigator.pop();
          } else if (Platform.isIOS) {
            exit(0);
          }
          return false;
        },
        shouldAddCallback: true,
        child: Scaffold(
          backgroundColor: AppColors.plainWhite,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: Text(
              "Own the City",
              style: TextStyle(color: AppColors.kPrimaryColor),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            shadowColor: AppColors.plainWhite,
            elevation: 0,
          ),
          bottomNavigationBar: CustomNavBar(
            color: AppColors.plainWhite,
          ),
          body: const HomepageBody(),
        ),
      ),
    );
  }
}
