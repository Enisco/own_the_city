// ignore_for_file: must_be_immutable


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:own_the_city/app/models/contest_model.dart';
import 'package:own_the_city/app/resources/app.logger.dart';
import 'package:own_the_city/ui/features/homepage/presentation/views/widgets/custom_readmore.dart';
import 'package:own_the_city/ui/shared/spacer.dart';
import 'package:own_the_city/utils/app_constants/app_colors.dart';
import 'package:own_the_city/utils/app_constants/app_styles.dart';
import 'package:own_the_city/utils/extension_and_methods/string_cap_extensions.dart';
import 'package:own_the_city/utils/screen_util/screen_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContestsCard extends StatelessWidget {
  ContestsCard({super.key, required this.contestData});

  ContestModel? contestData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 6),
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      width: screenSize(context).width,
      height: 338,
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
                    '${contestData?.userProfilePicsLink}',
                  ),
                ),
              ),
              const SizedBox(width: 16),
              SizedBox(
                height: 43,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${contestData?.userFullName}',
                          style:
                              AppStyles.regularStringStyle(14, AppColors.black),
                        ),
                        const SizedBox(width: 4),
                        contestData?.verified == true
                            ? Icon(
                                Icons.verified,
                                size: 16.5,
                                color: AppColors.regularBlue,
                              )
                            : const SizedBox(height: 16.5),
                      ],
                    ),
                    Text(
                      '${contestData?.location}',
                      style: AppStyles.hintStringStyle(12),
                    ),
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
              const Icon(
                CupertinoIcons.ellipsis,
                size: 22,
              ),
            ],
          ),
          CustomSpacer(12),
          Container(
            width: screenSize(context).width,
            // width: 330,
            height: 176,
            decoration: BoxDecoration(
              color: AppColors.blueGray,
              image: DecorationImage(
                image: NetworkImage(
                  '${contestData?.contestCoverPictureLink}',
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Container(
                  width: screenSize(context).width,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppColors.black.withOpacity(0.5),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(top: 12, left: 20),
                    child: Text(
                      '${contestData?.contestName}'.toTitleCase,
                      style: AppStyles.regularStringStyle(
                        14,
                        AppColors.plainWhite,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomSpacer(13),
          Row(
            children: [
              InkWell(
                onTap: () {
                  //TODO: Like or unlike the contest
                },
                child: Icon(
                  contestData?.liked == true
                      ? CupertinoIcons.heart_fill
                      : CupertinoIcons.heart,
                  size: 20,
                  color: contestData?.liked == true
                      ? AppColors.coolRed
                      : AppColors.darkGray,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                '${contestData?.likes} Likes',
                style: AppStyles.regularStringStyle(12, AppColors.black),
              ),
            ],
          ),
          CustomSpacer(8),
          SizedBox(
            height: 35,
            width: screenSize(context).width - 10,
            child: CustomReadMoreText(
              '${contestData?.contestDescription}',
              trimLines: 2,
              colorClickableText: Colors.pink,
              trimMode: TrimMode.line,
              trimCollapsedText: ' More',
              trimExpandedText: 'Show less',
              style: AppStyles.regularStringStyle(
                      12, AppColors.fullBlack.withOpacity(0.4))
                  .copyWith(fontWeight: FontWeight.w500),
              moreStyle: AppStyles.floatingHintStringStyleColored(
                12,
                AppColors.darkGray,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
