import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:own_the_city/app/resources/app.logger.dart';
import 'package:own_the_city/ui/features/homepage/data/feeds.dart';
import 'package:own_the_city/ui/shared/feeds_card.dart';
import 'package:own_the_city/utils/app_constants/app_colors.dart';
import 'package:own_the_city/utils/screen_util/screen_util.dart';

var log = getLogger('HomepageBody');

class HomepageBody extends StatefulWidget {
  const HomepageBody({super.key});

  @override
  State<HomepageBody> createState() => _HomepageBodyState();
}

class _HomepageBodyState extends State<HomepageBody> {
  @override
  void initState() {
    super.initState();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
        SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: screenSize(context).width / 18,
              vertical: 10,
            ),
            color: AppColors.lighterGray,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: feedData.length,
              itemBuilder: (BuildContext context, int index) {
                return FeedsCard(feedData: feedData[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}
