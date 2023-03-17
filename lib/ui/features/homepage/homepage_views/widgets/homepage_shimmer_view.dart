import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:own_the_city/ui/shared/spacer.dart';
import 'package:own_the_city/utils/app_constants/app_colors.dart';
import 'package:own_the_city/utils/screen_util/screen_util.dart';

class HomepageShimmer extends StatefulWidget {
  const HomepageShimmer({super.key});

  @override
  State<HomepageShimmer> createState() => _HomepageShimmerState();
}

class _HomepageShimmerState extends State<HomepageShimmer> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16,
                    bottom: 6,
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 8,
                  ),
                  width: screenSize(context).width,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(31),
                    ),
                    color: AppColors.blueGray,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            child: CircleAvatar(
                              backgroundColor: AppColors.darkGray,
                              radius: 21.5,
                            ),
                          ),
                          const SizedBox(width: 16),
                          SizedBox(
                            height: 43,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 15,
                                      color: AppColors.darkGray,
                                    ),
                                  ],
                                ),
                                CustomSpacer(4),
                                Row(
                                  children: [
                                    Container(
                                      width: 65,
                                      height: 12,
                                      color: AppColors.darkGray,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      CustomSpacer(12),
                      Container(
                        width: screenSize(context).width,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(31),
                          ),
                          color: AppColors.blueGray,
                        ),
                      ),
                      CustomSpacer(10),
                      Row(
                        children: [
                          Container(
                            height: 35,
                            width: 55,
                            color: AppColors.darkGray,
                          ),
                        ],
                      ),
                      CustomSpacer(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 100,
                            height: 35,
                            color: AppColors.darkGray,
                          ),
                          const SizedBox(
                            width: 50,
                            height: 15,
                            // color: AppColors.darkGray,
                            child: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                      CustomSpacer(10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
