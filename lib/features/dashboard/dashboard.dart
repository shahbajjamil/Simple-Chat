import 'package:flutter/material.dart';
import 'package:simplechat/Constants/app_color.dart';
import 'package:simplechat/features/dashboard/scroll_to_hide.dart';
import 'package:simplechat/features/home/screen/home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  static const String routeName = '/Home_Screen';

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;
  late ScrollController scrollViewController;

  late List<Widget> _body = [
    // HomeScreen(scrollViewController: scrollViewController),
    // Center(child: Text('Profile')),
    // Center(child: Text('Post')),
    // Center(child: Text('Settings')),
  ];

  @override
  void initState() {
    // TODO: implement initState
    scrollViewController = ScrollController();
    _body = [
      HomeScreen(scrollViewController: scrollViewController),
      Center(child: Text('Profile')),
      Center(child: Text('Post')),
      Center(child: Text('Settings')),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey,
        child: _body[currentIndex],
      ),
      bottomNavigationBar: ScrollToHide(
        // height: 80,
        scrollViewController: scrollViewController,
        child: BottomNavigationBar(
          // backgroundColor: Colors.red,

          type: BottomNavigationBarType.fixed,
          // selectedLabelStyle: TextStyle(
          //   fontSize: 0,
          //   fontWeight: FontWeight.bold,
          //   color: Colors.white,
          // ),
          // unselectedFontSize: 0,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          items: bottomNavList,
          currentIndex: currentIndex,
          selectedItemColor: AppColor.darkGreen,
          unselectedIconTheme:
              IconThemeData(color: AppColor.darkGreen.withOpacity(0.5)),
          onTap: (index) {
            print(index);
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> get bottomNavList {
    return const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.message),
        // : Icon(Icons.message_outlined)s,
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: 'Search',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.add_box),
        label: 'Add',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
      ),
    ];
  }
}
