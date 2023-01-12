

import 'package:go_router/go_router.dart';
import 'package:own_the_city/app/resources/app.transitions.dart';
import 'package:own_the_city/app/services/navigation_service.dart';
import 'package:own_the_city/ui/features/homepage/presentation/views/homepage.dart';
import 'package:own_the_city/ui/features/record_screen/view/record_view.dart';
import 'package:own_the_city/ui/features/splash_screen/presentation/views/splash_screen.dart';

class AppRouter {
  static final router = GoRouter(
    navigatorKey: NavigationService.navigatorKey,
    initialLocation: '/',
    // initialLocation: '/homepageView',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      // GoRoute(
      //   path: '/testScreen',
      //   builder: (context, state) => const TestScreen(),
      // ),

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
        path: '/recordPageVew',
        builder: (context, state) => const RecordPageView(),
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
