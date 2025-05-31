import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopp/Homepage/presentation/view/wedget/displayitems.dart';
import 'package:shopp/Homepage/presentation/view/wedget/selectsection.dart';
import 'package:shopp/Homepage/presentation/viewModel/Clothescubit/colthescubit_cubit.dart';
import 'package:shopp/Homepage/presentation/viewModel/screens/screens_cubit.dart';
import 'package:shopp/constant.dart';

class furniturebody extends StatefulWidget {
  const furniturebody({super.key});

  @override
  State<furniturebody> createState() => _FragrancesbodyState();
}

class _FragrancesbodyState extends State<furniturebody> {
  @override
  void initState() {
    
    BlocProvider.of<ColthescubitCubit>(context).fetchCategoryProducts(TabItem.furniture);
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
            child: Text("furniture",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          Expanded(child: Displayitems()),
        ],
      ),
    );
  }
}
