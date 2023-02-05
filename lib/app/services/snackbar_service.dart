import 'package:flutter/material.dart';
import 'package:own_the_city/utils/app_constants/app_colors.dart';

showCustomSnackBar(BuildContext context, content, onpressed, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(milliseconds: 500),
      backgroundColor: color,
      content: content is String ? Text(content) : content,
      // margin: const EdgeInsets.all(10),
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: '',
        textColor: AppColors.plainWhite,
        onPressed: () {
          // Some code to undo the change.
          onpressed;
        },
      ),
    ),
  );
}
