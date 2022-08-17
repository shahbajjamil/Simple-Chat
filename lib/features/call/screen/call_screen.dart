import 'package:flutter/material.dart';
import 'package:simplechat/Constants/image_constants.dart';
import 'package:simplechat/features/home/widgets/no_data_widegt.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({Key? key}) : super(key: key);

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    return NoDataWidgets(
        title: "No Phone Call",
        description:
            "You didn't made any conversation yet,\nplease make a call.",
        imageUrl: AppImage.callbg);
  }
}
