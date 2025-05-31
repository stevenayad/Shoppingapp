import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopp/Homepage/presentation/view/wedget/fragrancesbody.dart';
import 'package:shopp/Homepage/presentation/view/wedget/Beatuybody.dart';
import 'package:shopp/Homepage/presentation/view/wedget/furniturebody.dart';
import 'package:shopp/Homepage/presentation/view/wedget/groceriesbody.dart';
import 'package:shopp/Homepage/presentation/viewModel/screens/screens_cubit.dart';

class Choosescreen extends StatelessWidget {
  const Choosescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScreensCubit, TabItem>(
      builder: (context, tab) {
        switch (tab) {
          case TabItem.beauty:
            return const Beautyebody();
          case TabItem.fragrances:
            return const fragrancesbody();
          case TabItem.furniture:
            return const furniturebody();
          case TabItem.groceries:
            return const groceriesbody();
          default:
            return const Center(child: Text('No content available'));
        }
      },
    );
  }
}
