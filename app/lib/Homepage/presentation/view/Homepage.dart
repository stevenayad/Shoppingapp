import 'package:flutter/material.dart';
import 'package:shopp/Homepage/presentation/view/wedget/HomepageBodyWrapper.dart';
import 'package:shopp/Homepage/presentation/view/wedget/appbarbuild.dart';
import 'package:shopp/Homepage/presentation/view/wedget/bottomnavgitorbat.dart';
import 'package:shopp/Homepage/presentation/view/wedget/mylovescreen.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedItem = 1;

  final List<Widget> screens = [
    const Mylovescreen(),
    const HomepageBodyWrapper(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarbuild(context),
      bottomNavigationBar: BottomNavBar(
        selectedItem: selectedItem,
        onTap: (int value) {
          setState(() {
            selectedItem = value;
          });
        },
      ),
      body: screens[selectedItem],
    );
  }
}
