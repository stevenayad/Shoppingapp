import 'package:flutter/material.dart';

Widget buildLabel(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 10, bottom: 5),
    child: Text(
      text,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );
}
