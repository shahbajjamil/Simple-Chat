import 'package:flutter/material.dart';
import 'package:simplechat/Constants/app_color.dart';
import 'package:simplechat/Utils/screen_size.dart';
import 'package:simplechat/features/message/screen/add_your_status.dart';
import 'package:simplechat/features/message/screen/status_message_screen.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: screenWidth(context) * 0.2 + 40,
          // color: Colors.purple,
          // width: double.infinity,
          // margin: EdgeInsets.symmetric(vertical: 10),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: ((context, index) {
                if (index == 0) {
                  return AddYourStatus();
                } else {
                  return StatusProfile(
                    userName: "Jhon",
                    userImageUrl:
                        "https://randomuser.me/api/portraits/women/${++index}.jpg",
                    statusSeen: StatusSeen.seen,
                    userActive: UserActive.away,
                  );
                }
              })),
          // child: (
          //   children: [
          //     AddYourStatus(),
          //     StatusProfile(
          //         userName: "Vilma aaaa aaa aaaaa",
          //         userImageUrl:
          //             "https://randomuser.me/api/portraits/women/22.jpg"),
          //     StatusProfile(
          //       userName: "Jhon",
          //       userImageUrl: "https://randomuser.me/api/portraits/men/22.jpg",
          //       statusSeen: StatusSeen.seen,
          //       userActive: UserActive.online,
          //     ),
          //     StatusProfile(
          //       userName: "Dianna",
          //       userImageUrl: "https://randomuser.me/api/portraits/men/22.jpg",
          //       statusSeen: StatusSeen.notSeen,
          //       userActive: UserActive.away,
          //     ),
          //   ],
          // ),
        ),
      ],
    );
  }
}
