
import 'package:flutter/material.dart';
import 'package:own_the_city/app/resources/app.locator.dart';
import 'package:own_the_city/own_the_city_app.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  setPathUrlStrategy(); // Will be removed on production
  await setupLocator();
  runApp(OwnTheCityApp());
}
