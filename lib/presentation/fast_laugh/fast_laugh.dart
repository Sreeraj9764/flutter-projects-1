import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(child: Text("Fast")),
    );
  }
}
