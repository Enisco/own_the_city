import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:own_the_city/utils/app_constants/app_colors.dart';

class AppMainWrapper extends StatelessWidget {
  final MaterialApp child;
  const AppMainWrapper({
    required this.child,
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle().copyWith(
        statusBarColor: AppColors.scaffoldBackgroundColor(context),
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColors.scaffoldBackgroundColor(context),
      ),
    );
    return MediaQuery(
      data: const MediaQueryData().copyWith(
        textScaleFactor: 1,
        devicePixelRatio: 1,
      ),
      child: child,
    );
  }
}
