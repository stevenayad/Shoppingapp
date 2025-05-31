import 'package:flutter/material.dart';
import 'package:shopp/Detailspage/presentation/views/Wedget/Detailsitem.dart';
import 'package:shopp/Detailspage/presentation/views/Wedget/InformationDetails.dart';
import 'package:shopp/Homepage/data/Models/colthe_model/product.dart';


class Detailspagebody extends StatelessWidget {
  const Detailspagebody({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: size.height * 0.7,
                margin: EdgeInsets.only(top: size.height * 0.3),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    )),
                child: Detailsitem(
                  product: product,
                ),
              ),
              InfomrationDetails(
                product: product,
              ),
            ],
          )
        ],
      ),
    );
  }
}
