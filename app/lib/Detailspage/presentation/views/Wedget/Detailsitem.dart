import 'package:flutter/material.dart';
import 'package:shopp/Detailspage/presentation/views/Wedget/buy.dart';
import 'package:shopp/Detailspage/presentation/views/Wedget/lastsection.dart';
import 'package:shopp/Detailspage/presentation/views/Wedget/sizeandcolor.dart';
import 'package:shopp/Homepage/data/Models/colthe_model/product.dart';
import 'package:shopp/constant.dart';


class Detailsitem extends StatelessWidget {
  const Detailsitem({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        sizeandcolor(
          product: product,
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(kDefaultPaddin),
          child: Text(product.description ?? '',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 16)),
        ),
        buy(product: product),
        lastsection(
          product: product,
        ),
      ],
    );
  }
}
