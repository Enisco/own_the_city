import 'package:go_router/go_router.dart';
import 'package:own_the_city/app/resources/app.transitions.dart';
import 'package:own_the_city/app/services/navigation_service.dart';
import 'package:own_the_city/ui/create_account/create_account_view/create_account_view.dart';
import 'package:own_the_city/ui/create_account/create_account_view/sign_in_exists_view.dart';
import 'package:own_the_city/ui/create_account/create_account_view/signin_user_view.dart';
import 'package:own_the_city/ui/create_account/create_account_view/update_account_view.dart';
import 'package:own_the_city/ui/features/activity/activity_view/activity_view.dart';
import 'package:own_the_city/ui/features/homepage/homepage_views/homepage.dart';
import 'package:own_the_city/ui/features/profile/profile_view/profile_view.dart';
import 'package:own_the_city/ui/features/record_screen/record_view/record_view.dart';
import 'package:own_the_city/ui/features/splash_screen/splash_screen.dart';


class AppRouter {
  static final router = GoRouter(
    navigatorKey: NavigationService.navigatorKey,
    // initialLocation: '/createAccountView',
    // initialLocation: '/homepageView',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),

      /// App Pages
      GoRoute(
        path: '/homepageView',
        builder: (context, state) => const HomepageView(),
      ),
      GoRoute(
        path: '/recordPageView',
        builder: (context, state) => const RecordPageView(),
      ),
      GoRoute(
        path: '/profilePageView',
        builder: (context, state) => const ProfilePageView(),
      ),
      GoRoute(
        path: '/activityPageView',
        builder: (context, state) => const ActivityPageView(),
      ),
      // 
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
        path: '/updateNewAccountView',
        builder: (context, state) => UpdateNewAccountView(),
      ),
    ],
  );
}
