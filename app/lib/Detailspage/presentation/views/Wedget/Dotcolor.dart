import 'package:flutter/material.dart';

import '../../../../constant.dart';

class Dotcolor extends StatelessWidget {
  const Dotcolor({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 1, left: 20),
      child: Container(
        margin: const EdgeInsets.only(
          right: kDefaultPaddin / 2,
        ),
        width: 23,
        height: 23,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blue), shape: BoxShape.circle),
        child: DecoratedBox(
            decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
      ),
    );
  }
}
