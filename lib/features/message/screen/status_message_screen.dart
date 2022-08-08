import 'package:flutter/material.dart';
import 'package:simplechat/Constants/app_color.dart';
import 'package:simplechat/Utils/screen_size.dart';

enum UserActive { online, offline, away }

enum StatusSeen { seen, notSeen }

class StatusProfile extends StatelessWidget {
  const StatusProfile({
    Key? key,
    this.userActive = UserActive.offline,
    this.statusSeen = StatusSeen.notSeen,
    required this.userImageUrl,
    required this.userName,
  }) : super(key: key);
  final UserActive userActive;
  final StatusSeen statusSeen;
  final String userImageUrl;
  final String userName;

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

  Color get statusSeenColor {
    switch (statusSeen) {
      case StatusSeen.seen:
        return AppColor.grey;
      case StatusSeen.notSeen:
        return AppColor.darkGreen;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context) * 0.2 + 10,
      // height: screenWidth(context) * 0.2 + 10,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                height: screenWidth(context) * 0.2,
                width: screenWidth(context) * 0.2,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: statusSeenColor,
                        spreadRadius: 2,
                      ),
                    ],
                    shape: BoxShape.circle,
                    color: Colors.green,
                    image: DecorationImage(image: NetworkImage(userImageUrl))),
              ),
              Positioned(
                bottom: screenWidth(context) * .015,
                right: screenWidth(context) * .015,
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
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              userName,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          )
        ],
      ),
    );
  }
}
