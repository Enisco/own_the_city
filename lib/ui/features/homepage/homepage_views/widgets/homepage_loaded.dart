import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:own_the_city/ui/features/homepage/homepage_controller/homepage_controller.dart';
import 'package:own_the_city/ui/features/homepage/homepage_views/widgets/feeds_card.dart';
import 'package:own_the_city/utils/app_constants/app_colors.dart';
import 'package:own_the_city/utils/screen_util/screen_util.dart';

class HompageLoaded extends StatefulWidget {
  const HompageLoaded({super.key});

  @override
  State<HompageLoaded> createState() => _HompageLoadedState();
}

class _HompageLoadedState extends State<HompageLoaded> {
  final _controller = Get.put(HomepageController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomepageController>(
        init: HomepageController(),
        builder: (_) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenSize(context).width / 18,
                    vertical: 10,
                  ),
                  color: AppColors.lighterGray,
                  child: ListView.builder(
                    reverse: false,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _controller.feedData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return FeedsCard(
                        feedData: _controller.feedData[index],
                      );
                    },
                  ),
                )
              ],
            ),
          );
        });
  }
}
