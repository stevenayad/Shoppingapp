import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopp/Homepage/presentation/view/wedget/displayitems.dart';
import 'package:shopp/Homepage/presentation/view/wedget/selectsection.dart';
import 'package:shopp/Homepage/presentation/viewModel/Clothescubit/colthescubit_cubit.dart';
import 'package:shopp/Homepage/presentation/viewModel/screens/screens_cubit.dart';
import 'package:shopp/constant.dart';

class Beautyebody extends StatefulWidget {
  const Beautyebody({super.key});

  @override
  State<Beautyebody> createState() => _BeautyebodyState();
}

class _BeautyebodyState extends State<Beautyebody> {
  @override
  void initState() {
    BlocProvider.of<ColthescubitCubit>(context)
        .fetchCategoryProducts(TabItem.beauty);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: const EdgeInsets.all(kDefaultPaddin / 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const selectsection(),
          const Padding(
            padding: EdgeInsets.only(left: 22),
            child: Text("Beauty",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: const Displayitems(),
          ),
        ],
      ),
    );
  }
}
