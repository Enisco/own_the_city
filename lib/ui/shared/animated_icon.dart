import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:own_the_city/utils/app_constants/app_colors.dart';

class CustomAnimatedIcon extends StatefulWidget {
  final void Function()? onPressed;
  const CustomAnimatedIcon({super.key, this.onPressed});

  @override
  State<CustomAnimatedIcon> createState() => CustomAnimatedIconState();
}

class CustomAnimatedIconState extends State<CustomAnimatedIcon> {
  double turns = 0.0;
  bool glowThumb = false;

  void _changeRotation() {
    setState(() {
      glowThumb = true;
      turns -= 1.0 / 16.0;
    });
    widget.onPressed ?? print("No function attached");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5),
            child: AnimatedRotation(
              turns: turns,
              duration: const Duration(milliseconds: 250),
              child: AvatarGlow(
                glowColor: glowThumb ? AppColors.kPrimaryColor : Colors.white,
                endRadius: 20.0,
                duration: const Duration(milliseconds: 2000),
                repeat: true,
                showTwoGlows: true,
                animate: true,
                repeatPauseDuration: const Duration(milliseconds: 100),
                child: InkWell(
                  onTap: _changeRotation,
                  child: Icon(
                    glowThumb
                        ? CupertinoIcons.hand_thumbsup_fill
                        : CupertinoIcons.hand_thumbsup,
                    size: 25,
                    color: AppColors.kPrimaryColor,
                  ),
                ),
              ),
              onEnd: () {
                setState(() {
                  glowThumb = false;
                  turns = 0;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
