import 'package:flutter/material.dart';
import 'package:own_the_city/utils/app_constants/app_colors.dart';
import 'package:own_the_city/utils/app_constants/app_key_strings.dart';
import 'package:own_the_city/utils/app_constants/app_styles.dart';
import 'package:own_the_city/utils/screen_util/screen_util.dart';

class CustomAppbar extends StatelessWidget {
  final String? title;
  final Color? appbarColor, titleColor;
  const CustomAppbar({super.key, this.title, this.appbarColor, this.titleColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: screenSize(context).width,
      height: 60,
      color: appbarColor ?? AppColors.kPrimaryColor,
      child: Center(
        child: Text(
          title ?? AppKeyStrings.ownTheCity,
          style: AppStyles.regularStringStyle(18, titleColor ?? AppColors.plainWhite),
        ),
      ),
    );
  }
}
