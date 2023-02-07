import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:own_the_city/ui/features/activity/activity_controller/activity_controller.dart';
import 'package:own_the_city/ui/shared/spacer.dart';
import 'package:own_the_city/utils/app_constants/app_colors.dart';
import 'package:own_the_city/utils/app_constants/app_styles.dart';
import 'package:own_the_city/utils/screen_util/screen_util.dart';

class LeaderboardView extends StatefulWidget {
  const LeaderboardView({super.key});

  @override
  State<LeaderboardView> createState() => _LeaderboardViewState();
}

class _LeaderboardViewState extends State<LeaderboardView> {
  final _controller = Get.put(ActivityController());

  @override
  Widget build(BuildContext context) {
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
                        backgroundImage: CachedNetworkImageProvider(_controller
                            .activityFeedData[1].profileImageLink
                            .toString()),
                      ),
                    ),
                    CustomSpacer(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star_rate_rounded,
                          color: AppColors.silver,
                        ),
                        Column(
                          children: [
                            Text(
                              _controller.activityFeedData[1].username
                                  .toString(),
                              style: AppStyles.regularStringStyle(
                                15,
                                AppColors.plainWhite,
                              ),
                            ),
                            Text(
                              _controller.activityFeedData[1].totalPoints
                                  .toString(),
                              style: AppStyles.floatingHintStringStyleColored(
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
                        backgroundImage: CachedNetworkImageProvider(_controller
                            .activityFeedData[2].profileImageLink
                            .toString()),
                      ),
                    ),
                    CustomSpacer(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star_rate_rounded,
                          color: AppColors.bronze,
                        ),
                        Column(
                          children: [
                            Text(
                              _controller.activityFeedData[2].username
                                  .toString(),
                              style: AppStyles.regularStringStyle(
                                15,
                                AppColors.plainWhite,
                              ),
                            ),
                            Text(
                              _controller.activityFeedData[2].totalPoints
                                  .toString(),
                              style: AppStyles.floatingHintStringStyleColored(
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
                        backgroundImage: CachedNetworkImageProvider(_controller
                            .activityFeedData[0].profileImageLink
                            .toString()),
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
                              _controller.activityFeedData[0].username
                                  .toString(),
                              style: AppStyles.regularStringStyle(
                                15,
                                AppColors.plainWhite,
                              ),
                            ),
                            Text(
                              _controller.activityFeedData[0].totalPoints
                                  .toString(),
                              style: AppStyles.floatingHintStringStyleColored(
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
                padding: const EdgeInsets.only(top: 25, left: 12, right: 12),
                width: screenSize(context).width,
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: ListView.builder(
                  itemCount: _controller.activityFeedData.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 4,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(8),
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor:
                              AppColors.kPrimaryColor.withOpacity(0.6),
                          child: CircleAvatar(
                            radius: 22,
                            backgroundColor: AppColors.blueGray,
                            backgroundImage: CachedNetworkImageProvider(
                              _controller
                                  .activityFeedData[index].profileImageLink
                                  .toString(),
                            ),
                          ),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _controller.activityFeedData[index].username
                                  .toString(),
                              style: AppStyles.regularStringStyle(
                                14,
                                AppColors.kPrimaryColor,
                              ),
                            ),
                            CustomSpacer(5),
                            Text(
                              "${_controller.activityFeedData[index].city}, ${_controller.activityFeedData[index].country!.substring(_controller.activityFeedData[index].country!.length - 7)}",
                              style: AppStyles.floatingHintStringStyleColored(
                                11,
                                AppColors.black,
                              ),
                            ),
                          ],
                        ),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Rank: ",
                                        style: AppStyles.regularStringStyle(
                                          12,
                                          AppColors.inputFieldBlack,
                                        ),
                                      ),
                                      Text(
                                        "${index + 1}",
                                        style: AppStyles.regularStringStyle(
                                          28,
                                          AppColors.kPrimaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  CustomSpacer(5),
                                  Text(
                                    "${_controller.activityFeedData[index].totalPoints} points"
                                        .toString(),
                                    style: AppStyles
                                        .floatingHintStringStyleColored(
                                      11,
                                      AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
