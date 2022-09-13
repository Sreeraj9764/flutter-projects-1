import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_clone/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  final IconData? icon;
  const AppBarWidget({Key? key, required this.title, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth(10),
        Text(
          title,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        icon != null
            ? Icon(
                icon,
                size: 40,
                color: Colors.white,
              )
            : const SizedBox(),
        kWidth(10),
        Container(
          height: 40,
          width: 40,
          color: Colors.blue,
        ),
        kWidth(10)
      ],
    );
  }
}
