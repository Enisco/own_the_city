import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:own_the_city/app/resources/app.logger.dart';
import 'package:own_the_city/ui/shared/spacer.dart';
import 'package:own_the_city/utils/app_constants/app_colors.dart';
import 'package:own_the_city/utils/app_constants/app_key_strings.dart';
import 'package:own_the_city/utils/app_constants/app_styles.dart';
import 'package:own_the_city/utils/app_constants/app_sub_strings.dart';
import 'package:own_the_city/utils/screen_util/screen_util.dart';
import 'package:go_router/go_router.dart';

var log = getLogger('SplashScreen');

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  Animation? sizeAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000))
      ..forward();

    sizeAnimation = Tween(begin: 20.0, end: 50.0).animate(CurvedAnimation(
        parent: animationController!, curve: const Interval(0.0, 0.5)));

    animationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        log.wtf('Animation completed');
        sleep(const Duration(milliseconds: 200));
        context.pushReplacement('/createAccountView');
      }
    });
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.lighterGray,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.lighterGray,
      ),
      child: Scaffold(
        backgroundColor: AppColors.lighterGray,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '',
                style: AppStyles.subStringStyle(
                    sizeAnimation!.value * 0.3, AppColors.plainWhite),
              ),
              Center(
                child: AnimatedBuilder(
                    animation: animationController!,
                    builder: (context, child) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/cv_logo.svg',
                            height: sizeAnimation!.value,
                            width: sizeAnimation!.value,
                          ),
                          CustomSpacer(screenSize(context).height / 45),
                          Text(
                            AppKeyStrings.ownTheCity,
                            style: AppStyles.defaultKeyStringStyle(
                                sizeAnimation!.value * 0.75),
                          ),
                          CustomSpacer(screenSize(context).height / 100),
                          Text(
                            AppSubStrings.ownTheCitySub,
                            style: AppStyles.subStringStyle(
                                sizeAnimation!.value * 0.30,
                                AppColors.plainWhite),
                          ),
                        ],
                      );
                    }),
              ),
              Text(
                AppSubStrings.yearFUTA,
                style: AppStyles.subStringStyle(16, AppColors.plainWhite),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
