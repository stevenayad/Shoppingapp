import 'package:flutter/material.dart';
import 'package:shopp/Detailspage/presentation/views/Wedget/Button.dart';

class Numberofitem extends StatefulWidget {
  const Numberofitem({super.key});

  @override
  State<Numberofitem> createState() => _NumberofitemState();
}

class _NumberofitemState extends State<Numberofitem> {
  int num = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Button(
          function: () {
            setState(() {
              num++;
            });
          },
          icon: const Icon(Icons.add),
        ),
        const SizedBox(width: 7),
        Text(num.toString().padLeft(2, "0")),
        const SizedBox(width: 7),
        Button(
          function: () {
            if (num > 0) {
              setState(() {
                num--;
              });
            }
          },
          icon: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
