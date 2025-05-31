import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopp/core/goroute.dart';

class Restserbutton extends StatelessWidget {
  const Restserbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Dont Have An Account? ',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w100),
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(Goroute.Ksign);
          },
          child: const Text(
            'Register',
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w100, color: Colors.red),
          ),
        )
      ],
    );
  }
}
