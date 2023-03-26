// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:own_the_city/app/resources/app.router.dart';
import 'package:own_the_city/app/services/navigation_service.dart';
import 'package:own_the_city/ui/features/custom_nav_bar/page_index_class.dart';
import 'package:own_the_city/utils/app_constants/app_key_strings.dart';
import 'package:own_the_city/utils/app_constants/app_theme_data.dart';
import 'package:provider/provider.dart';

class OwnTheCityApp extends StatelessWidget {
  OwnTheCityApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// ChangeNotifierProvider here
    return ChangeNotifierProvider(
      create: (_) => CurrentPage(),
      child: MaterialApp.router(
        /// MaterialApp params
        title: AppKeyStrings.ownTheCity,
        scaffoldMessengerKey: NavigationService.scaffoldMessengerKey,
        debugShowCheckedModeBanner: false,
        theme: appThemeData,

        /// GoRouter specific params
        routeInformationProvider: _router.routeInformationProvider,
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
      ),
    );
  }

  // BuildContext? get ctx => _router.routerDelegate.navigatorKey.currentContext;
  final _router = AppRouter.router;
}
