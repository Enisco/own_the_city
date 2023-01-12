
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:own_the_city/app/resources/app.logger.dart';
import 'package:own_the_city/ui/features/homepage/data/contests.dart';
import 'package:own_the_city/ui/shared/contests_card.dart';
import 'package:own_the_city/utils/app_constants/app_colors.dart';
import 'package:own_the_city/utils/screen_util/screen_util.dart';

var log = getLogger('HomepageSliverBody');

class HomepageSliverBody extends StatefulWidget {
  const HomepageSliverBody({super.key});

  @override
  State<HomepageSliverBody> createState() => _HomepageSliverBodyState();
}

class _HomepageSliverBodyState extends State<HomepageSliverBody> {
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
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 1,
        (context, index) => Column(
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
                itemCount: contestFeedData.length,
                itemBuilder: (BuildContext context, int index) {
                  return ContestsCard(contestData: contestFeedData[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
