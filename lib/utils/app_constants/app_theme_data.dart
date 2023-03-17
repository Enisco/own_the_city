import 'package:flutter/material.dart';
import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:flutter/services.dart';

final appThemeData = ThemeData(
  primarySwatch: Colors.teal,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: AppBarTheme(
    systemOverlayStyle: const SystemUiOverlayStyle().copyWith(
      statusBarColor: Colors.grey[50],
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.grey[50],
    ),
  ),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      // TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      // TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      // TargetPlatform.android: ZoomPageTransitionsBuilder(),
      // TargetPlatform.iOS: CupertinoWillPopScopePageTransionsBuilder(),
    },
  ),
);
