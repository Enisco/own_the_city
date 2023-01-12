
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:own_the_city/app/resources/app.locator.dart';
import 'package:own_the_city/own_the_city_app.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  setPathUrlStrategy(); // Will be removed on production
  await setupLocator();

  Bloc.observer = TodoBlocObserver();
  runApp(OwnTheCityApp());
}

class TodoBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('onEvent $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('onTransition $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError $error');
    super.onError(bloc, error, stackTrace);
  }
}
