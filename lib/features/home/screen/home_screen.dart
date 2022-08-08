import 'package:flutter/material.dart';
import 'package:simplechat/Constants/app_color.dart';
import 'package:simplechat/Utils/screen_size.dart';
import 'package:simplechat/features/message/screen/message_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.scrollViewController}) : super(key: key);
  static const String routeName = '/Message_Screen';
final  ScrollController scrollViewController;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  // late ScrollController scrollViewController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    // scrollViewController = ScrollController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(tabController.index);
    return Scaffold(
      body: CustomScrollView(
        controller: widget.scrollViewController,
        slivers: [
          SliverAppBar(
            backgroundColor: AppColor.darkGreen,
            title: Text(
              tabController.index == 0
                  ? 'All Messages'
                  : tabController.index == 1
                      ? "All Groups"
                      : "All Contacts",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: false,
            pinned: true,
            floating: true,
            bottom: TabBar(
              labelStyle: TextStyle(
                fontSize: 20,
                // fontWeight: FontWeight.bold,
              ),
              controller: tabController,
              tabs: const [
                Tab(text: 'Messages'),
                Tab(text: "Groups"),
                Tab(text: "Call"),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: screenHeight(context) * 0.8,
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      MessageScreen(),
                      Container(
                        color: Colors.yellowAccent,
                        child: Center(
                          child: Text('Groups'),
                        ),
                      ),
                      Center(child: Text('Call')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
