import 'package:flutter/material.dart';
import 'package:simplechat/Utils/screen_size.dart';

class NoDataWidgets extends StatelessWidget {
  const NoDataWidgets({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
  }) : super(key: key);
  final String title;
  final String description;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: screenWidth(context) * .5,
          // height: screenWidth(context) * .5,
          padding: EdgeInsets.all(10),
          child: Image.asset(imageUrl),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
        )
      ],
    );
  }
}
