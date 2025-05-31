import 'package:flutter/material.dart';
import 'package:shopp/Detailspage/presentation/views/Wedget/Buybutton.dart';
import 'package:shopp/Homepage/data/Models/colthe_model/product.dart';
import 'package:shopp/constant.dart';


import 'addcart.dart';

class lastsection extends StatelessWidget {
  const lastsection({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPaddin),
      child: Row(
        children: [
        const  Expanded(
            flex: 1,
            child: addShoppingcard(),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
              flex: 4,
              child:
                  BuyButton(onPressed: () {}, child: const Text("BUY BUTTON")))
        ],
      ),
    );
  }
}
