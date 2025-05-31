import 'package:flutter/material.dart';
import 'package:shopp/Homepage/data/Models/colthe_model/product.dart';

import 'package:shopp/Detailspage/presentation/views/Wedget/numberofitem.dart';
import 'package:shopp/constant.dart';


class buy extends StatelessWidget {
  const buy({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(kDefaultPaddin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Numberofitem(),
          SizedBox(
            width: 20,
          ),

        ],
      ),
    );
  }
}
