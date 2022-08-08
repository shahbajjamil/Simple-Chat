import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:simplechat/Utils/screen_size.dart';

class ScrollToHide extends StatefulWidget {
  const ScrollToHide(
      {Key? key, required this.scrollViewController, required this.child})
      : super(key: key);
  final ScrollController scrollViewController;
  final Widget child;

  @override
  State<ScrollToHide> createState() => _ScrollToHideState();
}

class _ScrollToHideState extends State<ScrollToHide> {
  bool _isVisible = true;

  @override
  void initState() {
    // TODO: implement initState
    widget.scrollViewController.addListener(() {
      if (widget.scrollViewController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        print("going reverse");
        setState(() {
          _isVisible = false;
        });
      } else {
        print("going forward");
        setState(() {
          _isVisible = true;
        });
      }
      if (widget.scrollViewController.position.userScrollDirection ==
          ScrollDirection.idle) {
        setState(() {
          _isVisible = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: _isVisible
          ? kBottomNavigationBarHeight + mediaQueryData(context).padding.bottom
          : 0,
      child: Wrap(
        children: [widget.child],
      ),
    );
  }
}
