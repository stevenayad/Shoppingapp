import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopp/Homepage/presentation/view/wedget/displayitems.dart';
import 'package:shopp/Homepage/presentation/view/wedget/selectsection.dart';
import 'package:shopp/Homepage/presentation/viewModel/Clothescubit/colthescubit_cubit.dart';
import 'package:shopp/Homepage/presentation/viewModel/screens/screens_cubit.dart';
import 'package:shopp/constant.dart';

class fragrancesbody extends StatefulWidget {
  const fragrancesbody({super.key});

  @override
  State<fragrancesbody> createState() => _fragrancesbodyState();
}

class _fragrancesbodyState extends State<fragrancesbody> {
  @override
  void initState() {
   
    BlocProvider.of<ColthescubitCubit>(context)
        .fetchCategoryProducts(TabItem.fragrances);
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
            child: Text("fragrances",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          Expanded(child: Displayitems()),
        ],
      ),
    );
  }
}
