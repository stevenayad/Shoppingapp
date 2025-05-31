import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.icon, required this.function});
  final Icon icon;
  final VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(onPressed: function, child: icon);
  }
}
