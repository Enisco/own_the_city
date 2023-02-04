// ignore_for_file: must_be_immutable

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:own_the_city/app/models/feed_model.dart';
import 'package:own_the_city/ui/features/homepage/views/widgets/animated_icon.dart';
import 'package:own_the_city/ui/shared/spacer.dart';
import 'package:own_the_city/utils/app_constants/app_colors.dart';
import 'package:own_the_city/utils/app_constants/app_styles.dart';
import 'package:own_the_city/utils/screen_util/screen_util.dart';

class FeedsCard extends StatefulWidget {
  FeedsCard({super.key, required this.feedData});

  FeedModel? feedData;

  @override
  State<FeedsCard> createState() => _FeedsCardState();
}

class _FeedsCardState extends State<FeedsCard> with TickerProviderStateMixin {
  late var _animationController, _progress;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _progress =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 6),
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      width: screenSize(context).width,
      // height: 338,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(31),
        ),
        color: AppColors.plainWhite,
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                child: CircleAvatar(
                  backgroundColor: AppColors.blueGray,
                  radius: 21.5,
                  backgroundImage: NetworkImage(
                    '${widget.feedData?.userProfilePicsLink}',
                  ),
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
                        Text(
                          '${widget.feedData?.username}',
                          style:
                              AppStyles.regularStringStyle(14, AppColors.black),
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
            // width: 330,
            height: 250,
            decoration: BoxDecoration(
              color: AppColors.blueGray,
              image: DecorationImage(
                image: NetworkImage(
                  '${widget.feedData?.feedCoverPictureLink}',
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          CustomSpacer(5),
          Row(
            children: [
              CustomAnimatedIcon(
                onPressed: (() {
                  print("object");
                }),
              ),
              const SizedBox(width: 4),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomSpacer(3),
                  Text(
                    '${widget.feedData?.thumbsUp} thumbsUp',
                    style: AppStyles.regularStringStyle(12, AppColors.black),
                  ),
                ],
              ),
            ],
          ),
          // CustomSpacer(5),
          ExpandablePanel(
            header: Text(
              '${widget.feedData?.feedName}',
              style: AppStyles.regularStringStyle(14, AppColors.black),
            ),
            collapsed: Text(
              '${widget.feedData?.feedDescription}',
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            expanded: Text(
              '${widget.feedData?.feedDescription}',
              softWrap: true,
            ),
            theme: ExpandableThemeData(
              iconPadding: const EdgeInsets.only(top: 0),
              iconColor: AppColors.kPrimaryColor,
              tapBodyToCollapse: true,
              tapBodyToExpand: true,
              tapHeaderToExpand: true,
              iconSize: 35,
              headerAlignment: ExpandablePanelHeaderAlignment.center,
              iconPlacement: ExpandablePanelIconPlacement.right,
            ),
          ),
          CustomSpacer(10),
        ],
      ),
    );
  }
}
