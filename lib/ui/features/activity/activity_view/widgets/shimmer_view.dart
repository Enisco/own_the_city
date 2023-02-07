import 'package:flutter/material.dart';
import 'package:own_the_city/ui/shared/spacer.dart';
import 'package:own_the_city/utils/app_constants/app_colors.dart';
import 'package:own_the_city/utils/screen_util/screen_util.dart';
import 'package:shimmer/shimmer.dart';

class ActivityShimmerView extends StatefulWidget {
  const ActivityShimmerView({super.key});

  @override
  State<ActivityShimmerView> createState() => _ActivityShimmerViewState();
}

class _ActivityShimmerViewState extends State<ActivityShimmerView> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 280,
            width: screenSize(context).width,
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
                        backgroundColor: AppColors.blueGray,
                        radius: 55,
                        child: CircleAvatar(
                          backgroundColor: AppColors.blueGray,
                          radius: 45,
                        ),
                      ),
                      CustomSpacer(5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.star_rate_rounded,
                          ),
                          Column(
                            children: [
                              Container(
                                height: 15,
                                width: 40,
                                color: AppColors.regularBlue,
                              ),
                              CustomSpacer(2),
                              Container(
                                height: 15,
                                width: 60,
                                color: AppColors.regularGray,
                              )
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
                        backgroundColor: AppColors.blueGray,
                        radius: 55,
                        child: CircleAvatar(
                          radius: 45,
                          backgroundColor: AppColors.blueGray,
                        ),
                      ),
                      CustomSpacer(5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.star_rate_rounded,
                          ),
                          Column(
                            children: [
                              Container(
                                height: 15,
                                width: 40,
                                color: AppColors.regularBlue,
                              ),
                              CustomSpacer(2),
                              Container(
                                height: 15,
                                width: 60,
                                color: AppColors.regularGray,
                              )
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
                        backgroundColor: AppColors.blueGray,
                        radius: 70,
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: AppColors.blueGray,
                        ),
                      ),
                      CustomSpacer(5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.star_rate_rounded,
                          ),
                          Column(
                            children: [
                              Container(
                                height: 15,
                                width: 40,
                                color: AppColors.regularBlue,
                              ),
                              CustomSpacer(2),
                              Container(
                                height: 15,
                                width: 60,
                                color: AppColors.regularGray,
                              )
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
                  padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
                  width: screenSize(context).width,
                  decoration: BoxDecoration(
                    color: AppColors.blueGray,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 1.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const SizedBox(height: 60),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
