import 'package:flutter/material.dart';
import 'package:simplechat/Constants/app_color.dart';
import 'package:simplechat/Constants/image_constants.dart';
import 'package:simplechat/Utils/screen_size.dart';
import 'package:simplechat/features/home/widgets/no_data_widegt.dart';
import 'package:simplechat/features/message/widgets/add_your_status.dart';
import 'package:simplechat/features/message/widgets/simple_profile.dart';
import 'package:simplechat/features/message/widgets/status_message_screen.dart';

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
          height: screenWidth(context) * 0.2 + 30,

          /// 30 is the height of the status message screen
          // color: Colors.purple,
          // width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 10),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: ((context, index) {
                if (index == 0) {
                  return const AddYourStatus();
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
        ),
        // SliverList(delegate: SliverChildListDelegate([])),
        // NoDataWidgets(
        //     title: "No Coversation",
        //     description:
        //         "You didn't made any conversation yet,\nplease start conversation.",
        //     imageUrl: AppImage.msgbg),
        ChatListCard(),
        ChatListCard(),
        ChatListCard(),
        ChatListCard(),
        ChatListCard(),
      ],
    );
  }
}

class ChatListCard extends StatelessWidget {
  const ChatListCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      height: screenWidth(context) * 0.18,
      margin: const EdgeInsets.all(10),
      // color: Colors.red,
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SimpleProfile(
            userImageUrl: "https://randomuser.me/api/portraits/women/39.jpg",
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              // color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Expanded(
                        child: Text(
                          "Dianna Smiley",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text(
                        "3m ago",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const Text("Introducing yours identity",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
