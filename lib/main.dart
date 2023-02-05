// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:own_the_city/app/helpers/sharedprefs.dart';
import 'package:own_the_city/app/resources/app.locator.dart';
import 'package:own_the_city/own_the_city_app.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy(); // Will be removed on production
  await setupLocator();
  Firebase.initializeApp();
  runApp(OwnTheCityApp());
}
