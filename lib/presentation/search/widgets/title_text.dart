import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String title;
  final TextStyle style;
  const TitleText({Key? key, required this.style, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: style,
    );
  }
}
