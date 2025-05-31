import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shopp/constant.dart';
import 'package:shopp/core/goroute.dart';

AppBar appbarbuild(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      onPressed: () {},
      icon: SvgPicture.asset(
        "assets/icons/back-svgrepo-com.svg",
        height: 24,
        width: 24,
      ),
    ),
    actions: <Widget>[
      IconButton(
        onPressed: () async {
          await FirebaseAuth.instance.signOut();
          GoRouter.of(context).push(Goroute.Klogin);
        },
        icon: const Icon(Icons.exit_to_app),
      ),
      IconButton(
        onPressed: () {
          GoRouter.of(context).push(Goroute.KCardpage);
        },
        icon: SvgPicture.asset(
          "assets/icons/shopping-cart-02-svgrepo-com.svg",
          height: 24,
          width: 24,
        ),
      ),
      const SizedBox(
        width: kDefaultPaddin,
      )
    ],
  );
}
