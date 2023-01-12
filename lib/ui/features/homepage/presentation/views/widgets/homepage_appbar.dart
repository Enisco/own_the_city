import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:own_the_city/utils/app_constants/app_colors.dart';
import 'package:own_the_city/utils/app_constants/app_key_strings.dart';
import 'package:own_the_city/utils/app_constants/app_styles.dart';
import 'package:own_the_city/utils/screen_util/screen_util.dart';

var top = 0.0;
var appbarThreshold = 70.0;

class MySliverAppBar extends StatefulWidget {
  const MySliverAppBar({Key? key}) : super(key: key);

  @override
  State<MySliverAppBar> createState() => _MySliverAppBarState();
}

class _MySliverAppBarState extends State<MySliverAppBar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SliverAppBar(
      pinned: true,
      floating: true,
      snap: false,
      centerTitle: true,
      toolbarHeight: 50,
      expandedHeight: size.height / 8,
      backgroundColor: AppColors.plainWhite,
      elevation: 0,
      title: Text(
        AppKeyStrings.ownTheCity,
        style: AppStyles.keyStringStyle(18, AppColors.fullBlack),
      ),
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return FlexibleSpaceBar(
            expandedTitleScale: 1,
            titlePadding: const EdgeInsetsDirectional.only(
              start: 0.0,
              bottom: 0.0,
            ),
            centerTitle: false,
            title: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              top = constraints.biggest.height;

              return AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: 1.0,
                child: Stack(
                  children: [
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: top < appbarThreshold
                                  ? screenSize(context).height * 0.055
                                  : screenSize(context).height * 0.035),
                          height: 25,
                          width: screenSize(context).width,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                            color: AppColors.lighterGray,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0,
                                  top: top < appbarThreshold ? 8 : 0),
                              child: InkWell(
                                onTap: () => context.push('/createAccountView'),
                                child: Container(
                                  height: top < appbarThreshold ? 35 : 48,
                                  width: top < appbarThreshold ? 48 : 56,
                                  padding: EdgeInsets.all(
                                      top < appbarThreshold ? 9 : 13),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          top < appbarThreshold ? 18 : 20),
                                    ),
                                    color: AppColors.kPrimaryColor,
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/icons/chat.svg',
                                    color: AppColors.plainWhite,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 1),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
