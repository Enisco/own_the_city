import 'package:go_router/go_router.dart';
import 'package:own_the_city/app/resources/app.transitions.dart';
import 'package:own_the_city/app/services/navigation_service.dart';
import 'package:own_the_city/ui/create_account/create_account_view/create_account_view.dart';
import 'package:own_the_city/ui/create_account/create_account_view/sign_in_exists_view.dart';
import 'package:own_the_city/ui/create_account/create_account_view/signin_user_view.dart';
import 'package:own_the_city/ui/features/homepage/views/homepage.dart';
import 'package:own_the_city/ui/features/record_screen/view/record_view.dart';
import 'package:own_the_city/ui/features/splash_screen/splash_screen.dart';

class AppRouter {
  static final router = GoRouter(
    navigatorKey: NavigationService.navigatorKey,
    // initialLocation: '/recordPageView',
    // initialLocation: '/createAccountView',
    initialLocation: '/homepageView',
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
        path: '/signInExistingUserView',
        builder: (context, state) => SignInExistingUserView(),
      ),
      GoRoute(
        path: '/signInUserView',
        builder: (context, state) => SignInUserView(),
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
