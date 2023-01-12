import 'package:get_it/get_it.dart';
import 'package:own_the_city/app/services/navigation_service.dart';

GetIt _getIt = GetIt.I;

final locator = _getIt;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => NavigationService());
}
