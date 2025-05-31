import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopp/Detailspage/presentation/views/Wedget/Detailspagebody.dart';
import 'package:shopp/Homepage/data/Models/colthe_model/product.dart';
import 'package:shopp/constant.dart';


class Detailspage extends StatelessWidget {
  const Detailspage({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: appbarbuild(context),
      body: Detailspagebody(product: product),
    );
  }

  AppBar appbarbuild(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueGrey,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: SvgPicture.asset(
          "assets/icons/back-svgrepo-com.svg",
          height: 24,
          width: 24,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/icons/search-4-svgrepo-com.svg",
            height: 24,
            width: 24,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/icons/shopping-cart-02-svgrepo-com.svg",
            height: 24,
            width: 24,
          ),
        ),
        const SizedBox(width: kDefaultPaddin),
      ],
    );
  }
}
