import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  final IconData? icon;
  const AppBarWidget({Key? key, required this.title, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title),
        icon != null ? Icon(icon) : const SizedBox(),
        Container(
          color: Colors.blue,
        )
      ],
    );
  }
}
