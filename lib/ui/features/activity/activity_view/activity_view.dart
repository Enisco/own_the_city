import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:own_the_city/app/resources/app.logger.dart';
import 'package:own_the_city/ui/features/activity/activity_controller/activity_controller.dart';
import 'package:own_the_city/ui/features/activity/activity_view/widgets/leaderboard_view.dart';
import 'package:own_the_city/ui/features/activity/activity_view/widgets/activity_shimmer_view.dart';
import 'package:own_the_city/ui/features/custom_nav_bar/custom_navbar.dart';
import 'package:own_the_city/ui/features/custom_nav_bar/page_index_class.dart';
import 'package:own_the_city/ui/shared/custom_appbar.dart';
import 'package:own_the_city/utils/app_constants/app_colors.dart';
import 'package:own_the_city/utils/app_constants/app_key_strings.dart';
import 'package:own_the_city/utils/screen_util/screen_util.dart';
import 'package:provider/provider.dart';

var log = getLogger('ActivityPageView');

class ActivityPageView extends StatefulWidget {
  const ActivityPageView({super.key});

  @override
  State<ActivityPageView> createState() => _ActivityPageViewState();
}

class _ActivityPageViewState extends State<ActivityPageView> {
  final _controller = Get.put(ActivityController());

  @override
  void initState() {
    super.initState();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    _controller.getUserActivities();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ConditionalWillPopScope(
        onWillPop: () async {
          Provider.of<CurrentPage>(context, listen: false)
              .setCurrentPageIndex(0);
          context.pop();
          return false;
        },
        shouldAddCallback: true,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(screenSize(context).width, 60),
            child: CustomAppbar(
              title: AppKeyStrings.leaderboard,
            ),
          ),
          bottomNavigationBar: CustomNavBar(
            color: AppColors.plainWhite,
          ),
          body: GetBuilder<ActivityController>(
            init: ActivityController(),
            builder: (_) {
              return _controller.doneLoading
                  ? const LeaderboardView()
                  : const ActivityShimmerView();
            },
          ),
        ),
      ),
    );
  }
}
