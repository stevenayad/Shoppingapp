import 'package:flutter/material.dart';
import 'package:shopp/Detailspage/presentation/views/Wedget/Dotcolor.dart';
import 'package:shopp/Homepage/data/Models/colthe_model/product.dart';


class sizeandcolor extends StatelessWidget {
  const sizeandcolor({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: EdgeInsets.only(left: 18),
                child: Text(
                  "Color\n",
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 22,
                      fontWeight: FontWeight.normal),
                ),
              ),
              Row(
                children: [
                  Dotcolor(color: Colors.red),
                  Dotcolor(color: Colors.yellow),
                  Dotcolor(color: Colors.black),
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              const Text(
                "Rating\n",
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 22,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                "${product.rating}cm",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        )
      ],
    );
  }
}
