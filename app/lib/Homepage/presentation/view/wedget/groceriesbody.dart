import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopp/Homepage/presentation/view/wedget/displayitems.dart';
import 'package:shopp/Homepage/presentation/view/wedget/selectsection.dart';
import 'package:shopp/Homepage/presentation/viewModel/Clothescubit/colthescubit_cubit.dart';
import 'package:shopp/Homepage/presentation/viewModel/screens/screens_cubit.dart';
import 'package:shopp/constant.dart';

class groceriesbody extends StatefulWidget {
  const groceriesbody({super.key});

  @override
  State<groceriesbody> createState() => _FragrancesbodyState();
}

class _FragrancesbodyState extends State<groceriesbody> {
  @override
  void initState() {
    BlocProvider.of<ColthescubitCubit>(context)
        .fetchCategoryProducts(TabItem.groceries);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(kDefaultPaddin / 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          selectsection(),
          Padding(
            padding: EdgeInsets.only(left: 22),
            child: Text("groceries",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          Expanded(child: Displayitems()),
        ],
      ),
    );
  }
}
