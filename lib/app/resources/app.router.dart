

import 'package:go_router/go_router.dart';
import 'package:own_the_city/app/resources/app.transitions.dart';
import 'package:own_the_city/app/services/navigation_service.dart';
import 'package:own_the_city/ui/auth_create_account/auth_create_view/auth_create_view.dart';
import 'package:own_the_city/ui/features/homepage/views/homepage.dart';
import 'package:own_the_city/ui/features/record_screen/view/record_view.dart';
import 'package:own_the_city/ui/features/splash_screen/splash_screen.dart';

class AppRouter {
  static final router = GoRouter(
    navigatorKey: NavigationService.navigatorKey,
    // initialLocation: '/',
    initialLocation: '/createAccountView',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),

      /// App Pages
      /// 
      GoRoute(
        path: '/homepageView',
        builder: (context, state) => const HomepageView(),
        pageBuilder: (context, state) => CustomFadeTransition(
            child: const HomepageView(), key: state.pageKey),
      ),
      GoRoute(
        path: '/recordPageView',
        builder: (context, state) => const RecordPageView(),
        pageBuilder: (context, state) => CustomFadeTransition(
            child: const RecordPageView(), key: state.pageKey),
      ),
      GoRoute(
        path: '/createAccountView',
        builder: (context, state) => CreateAccountView(),
      ),

      GoRoute(
        path: '/splashScreen',
        builder: (context, state) => const SplashScreen(),
        pageBuilder: (context, state) => CustomFadeTransition(
            child: const SplashScreen(), key: state.pageKey),
      ),
    ],
  );
}
