import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:simplechat/Constants/app_color.dart';
import 'package:simplechat/Constants/image_constants.dart';
import 'package:simplechat/Utils/screen_size.dart';

import '../phone_login/phone_login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final ScrollController _scrollController = ScrollController();

  animateToMaxMin(double max, double min, double direction, int seconds,
      ScrollController scrollController) {
    scrollController
        .animateTo(direction,
            duration: Duration(seconds: seconds), curve: Curves.linear)
        .then((value) {
      direction = direction == max ? min : max;
      animateToMaxMin(max, min, direction, seconds, scrollController);
    });
  }

  @override
  void initState() {
    log('SplashScreen initState');
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      log(_scrollController.position.maxScrollExtent.toString());
      double minScrollExtent = _scrollController.position.minScrollExtent;
      double maxScrollExtent = _scrollController.position.maxScrollExtent;

      animateToMaxMin(maxScrollExtent, minScrollExtent, maxScrollExtent, 80,
          _scrollController);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColor.lightGreen,
              // AppColor.darkreen,s
              AppColor.darkGreen,
              AppColor.darkGreen,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: ListView.builder(
                  controller: _scrollController,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, i) {
                    i++;
                    return Stack(
                      // fit: StackFit.loose,
                      children: [
                        Container(
                          height: screenHeight(context) * .55,
                          width: screenWidth(context),
                        ),
                        ShowProfilePic(
                          radius: screenWidth(context) * .4,
                          imageURl: "women/" + i.toString() + "1",
                          top: screenWidth(context) * 0.2,
                          left: 10,
                        ),
                        ShowProfilePic(
                          radius: screenWidth(context) * .1,
                          imageURl: "women/" + i.toString() + "2",
                          top: screenWidth(context) * .2,
                          right: screenWidth(context) * .1,
                        ),
                        ShowProfilePic(
                          radius: screenWidth(context) * .25,
                          imageURl: "women/" + i.toString() + "3",
                          top: screenWidth(context) * .4,
                          right: screenWidth(context) * .13,
                        ),
                        ShowProfilePic(
                          radius: screenWidth(context) * .28,
                          imageURl: "women/" + i.toString() + "4",
                          bottom: screenWidth(context) * .18,
                          left: screenWidth(context) * .07,
                        ),
                        ShowProfilePic(
                          radius: screenWidth(context) * .3,
                          imageURl: "men/" + i.toString() + "2",
                          bottom: screenWidth(context) * 0.06,
                          right: screenWidth(context) * 0.02,
                        ),
                        ShowProfilePic(
                          radius: screenWidth(context) * .2,
                          imageURl: "men/" + i.toString() + "3",
                          bottom: screenWidth(context) * .4,
                          right: screenWidth(context) * .4,
                        ),
                      ],
                    );
                  }),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Find People &\nBe Social',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: AppColor.white,
                          letterSpacing: 1),
                    ),
                    const Text(
                      "Find your all friends in one place by\nsigning the apps quick&easily.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColor.white,
                        height: 1.5,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // _startScroll();
                        // animateToMaxMin(
                        //     _scrollController.position.minScrollExtent,
                        //     _scrollController.position.maxScrollExtent,
                        //     _scrollController.position.maxScrollExtent,
                        //     25,
                        //     _scrollController);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Text("Connect Facebook",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColor.black,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, PhoneLoginScreen.routeName);
                      },
                      child: const Text(
                        "Not now",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColor.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).padding.bottom,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShowProfilePic extends StatelessWidget {
  const ShowProfilePic({
    Key? key,
    required this.radius,
    required this.imageURl,
    this.left,
    this.top,
    this.right,
    this.bottom,
  }) : super(key: key);
  final double radius;
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;
  final String imageURl;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom,
      right: right,
      left: left,
      top: top,
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage(
              "https://randomuser.me/api/portraits/$imageURl.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
