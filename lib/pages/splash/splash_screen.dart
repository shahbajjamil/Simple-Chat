import 'package:flutter/material.dart';
import 'package:simplechat/Constants/app_color.dart';
import 'package:simplechat/Constants/image_constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColor.lightGreen,
              // AppColor.darkreen,s
              AppColor.darkreen,
              AppColor.darkreen,
            ],
          ),
          // image: DecorationImage(
          //   image: AssetImage(AppImage.bg),
          //   fit: BoxFit.cover,
          // ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Container(),
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
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: AppColor.white,
                        ),
                      ),
                      const Text(
                        "Find your all friends in one place by\nsigning the apps quick&easily.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColor.white,
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text("Connect Facebook",
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColor.black,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Text("Not now",
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColor.white,
                            fontWeight: FontWeight.bold,
                          )),
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
      ),
    );
  }
}
