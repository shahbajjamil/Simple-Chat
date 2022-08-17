import 'package:flutter/material.dart';
import 'package:simplechat/Constants/app_color.dart';
import 'package:simplechat/Utils/screen_size.dart';
import 'package:simplechat/features/message/widgets/status_message_screen.dart';

class SimpleProfile extends StatelessWidget {
  const SimpleProfile({
    Key? key,
    this.userActive = UserActive.offline,
    required this.userImageUrl,
  }) : super(key: key);
  final UserActive userActive;
  final String userImageUrl;

  Color get userActiveColor {
    switch (userActive) {
      case UserActive.online:
        return AppColor.darkGreen;
      case UserActive.offline:
        return AppColor.grey;
      case UserActive.away:
        return AppColor.yellow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // padding: const EdgeInsets.all(5),
          height: screenWidth(context) * 0.16,
          width: screenWidth(context) * 0.16,
          decoration: BoxDecoration(
              // border: Border.all(
              //   color: Colors.white,
              //   width: 2,
              // ),
              shape: BoxShape.circle,
              color: AppColor.grey.withOpacity(0.5),
              image: DecorationImage(image: NetworkImage(userImageUrl))),
        ),
        Positioned(
          bottom: screenWidth(context) * .001,
          right: screenWidth(context) * .001,
          child: Container(
            width: screenWidth(context) * .05,
            height: screenWidth(context) * .05,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: userActiveColor,
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
