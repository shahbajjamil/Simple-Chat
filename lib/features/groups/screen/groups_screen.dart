import 'package:flutter/material.dart';
import 'package:simplechat/Constants/app_color.dart';
import 'package:simplechat/Constants/image_constants.dart';
import 'package:simplechat/Utils/screen_size.dart';
import 'package:simplechat/features/home/widgets/no_data_widegt.dart';

class GroupsScreen extends StatefulWidget {
  const GroupsScreen({Key? key}) : super(key: key);

  @override
  State<GroupsScreen> createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
  @override
  Widget build(BuildContext context) {
    // return NoDataWidgets(
    //   title: "No Group Chat",
    //   description:
    //       "You didn't made any conversation yet,\nplease select username.",
    //   imageUrl: AppImage.groupbg,
    // );
    return GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15),
        itemBuilder: (BuildContext context, i) {
          if (i == 0) {
            return Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                  // spreadRadius: 2,
                ),
              ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: screenWidth(context, multiplyBy: 0.2),
                    height: screenWidth(context, multiplyBy: 0.2),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: AppColor.grey.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.add,
                      color: AppColor.black.withOpacity(0.6),
                      size: 35,
                    ),
                  ),
                  const Text("Create Group",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            );
          }
          return Container(
            padding: const EdgeInsets.all(5),
            // margin: const EdgeInsets.all(20),
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
                // spreadRadius: 2,
              ),
            ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.star,
                        color: AppColor.grey,
                      ),
                      onPressed: () {},
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.more_vert),
                      onPressed: () {},
                    ),
                  ],
                ),
                Container(
                  width: screenWidth(context, multiplyBy: 0.2),
                  height: screenWidth(context, multiplyBy: 0.2),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: const BoxDecoration(
                    color: AppColor.grey,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1660549071334-044b292af718?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw3fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=900&q=60"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Text("Group Chat",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Container(
                  alignment: Alignment.center,
                  // alignment: Alignment.bottomCenter,
                  // width: MediaQuery.of(context).size.width / 2,
                  height: screenWidth(context, multiplyBy: 0.12),
                  // margin: EdgeInsets.only(right: 20),
                  //  width: screenWidth(context, multiplyBy: 0.5),
                  //width: screenWidth(context, multiplyBy: 1),
                  // color: Colors.red,
                  child: Stack(
                    // alignment: Alignment.center,

                    // fit: StackFit.loose,
                    children: [
                      // for (int i = 1; i <= 5; i++)
                      for (var i in [
                        1,
                        2,
                        3,
                      ].reversed)
                        Container(
                          // color: i == 1 ? Colors.green : Colors.amber,
                          child: Container(
                            margin: EdgeInsets.only(
                                left: --i *
                                    screenWidth(context, multiplyBy: 0.1 / 2)),
                            alignment: Alignment.center,
                            width: screenWidth(context, multiplyBy: 0.1),
                            height: screenWidth(context, multiplyBy: 0.1),
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              // color: AppColor.grey,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColor.white,
                                width: 2,
                              ),
                              image: const DecorationImage(
                                image: const NetworkImage(
                                    "https://images.unsplash.com/photo-1660549071334-044b292af718?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw3fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=900&q=60"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Text(
                              i.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                backgroundColor: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
