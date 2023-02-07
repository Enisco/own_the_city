import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:own_the_city/app/resources/app.logger.dart';
import 'package:own_the_city/ui/features/activity/activity_controller/activity_controller.dart';
import 'package:own_the_city/ui/features/custom_nav_bar/custom_navbar.dart';
import 'package:own_the_city/ui/features/custom_nav_bar/page_index_class.dart';
import 'package:own_the_city/ui/shared/custom_appbar.dart';
import 'package:own_the_city/ui/shared/spacer.dart';
import 'package:own_the_city/utils/app_constants/app_colors.dart';
import 'package:own_the_city/utils/app_constants/app_key_strings.dart';
import 'package:own_the_city/utils/app_constants/app_styles.dart';
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
              return Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 280,
                    width: screenSize(context).width,
                    color: AppColors.kPrimaryColor,
                    child: Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: [
                        // Silver
                        Positioned(
                          right: screenSize(context).width -
                              (screenSize(context).width / 2 - 45),
                          child: Column(
                            children: [
                              CustomSpacer(60),
                              CircleAvatar(
                                radius: 55,
                                backgroundColor: AppColors.plainWhite,
                                child: CircleAvatar(
                                  radius: 45,
                                  backgroundColor: AppColors.blueGray,
                                ),
                              ),
                              CustomSpacer(5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.star_rate_rounded,
                                    // CupertinoIcons.star_circle_fill,
                                    color: AppColors.silver,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Sarah",
                                        style: AppStyles.regularStringStyle(
                                          15,
                                          AppColors.plainWhite,
                                        ),
                                      ),
                                      Text(
                                        "2347 points",
                                        style: AppStyles
                                            .floatingHintStringStyleColored(
                                          11,
                                          AppColors.plainWhite,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 25),
                                ],
                              )
                            ],
                          ),
                        ),
                        // Bronze
                        Positioned(
                          left: screenSize(context).width -
                              (screenSize(context).width / 2 - 45),
                          child: Column(
                            children: [
                              CustomSpacer(60),
                              CircleAvatar(
                                radius: 55,
                                backgroundColor: AppColors.plainWhite,
                                child: CircleAvatar(
                                  radius: 45,
                                  backgroundColor: AppColors.blueGray,
                                ),
                              ),
                              CustomSpacer(5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.star_rate_rounded,
                                    // CupertinoIcons.star_circle_fill,
                                    color: AppColors.bronze,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Sarah",
                                        style: AppStyles.regularStringStyle(
                                          15,
                                          AppColors.plainWhite,
                                        ),
                                      ),
                                      Text(
                                        "2347 points",
                                        style: AppStyles
                                            .floatingHintStringStyleColored(
                                          11,
                                          AppColors.plainWhite,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 25),
                                ],
                              )
                            ],
                          ),
                        ),
                        // Gold
                        Positioned(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomSpacer(10),
                              CircleAvatar(
                                radius: 70,
                                backgroundColor: AppColors.plainWhite,
                                child: CircleAvatar(
                                  radius: 60,
                                  backgroundColor: AppColors.blueGray,
                                ),
                              ),
                              CustomSpacer(5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star_rate_rounded,
                                    color: AppColors.gold,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Sarah",
                                        style: AppStyles.regularStringStyle(
                                          15,
                                          AppColors.plainWhite,
                                        ),
                                      ),
                                      Text(
                                        "2347 points",
                                        style: AppStyles
                                            .floatingHintStringStyleColored(
                                          11,
                                          AppColors.plainWhite,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 25),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 230),
                      Expanded(
                        child: Container(
                          width: screenSize(context).width,
                          decoration: BoxDecoration(
                            color: Colors.grey[50],
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: const [],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
