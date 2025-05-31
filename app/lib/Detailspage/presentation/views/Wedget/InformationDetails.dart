import 'package:flutter/material.dart';
import 'package:shopp/Homepage/data/Models/colthe_model/product.dart';
import 'package:shopp/constant.dart';

class InfomrationDetails extends StatelessWidget {
  const InfomrationDetails({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.title ?? ' ',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              RichText(
                  text: TextSpan(children: [
                const TextSpan(text: "Price\n"),
                TextSpan(
                    text: "\$${product.price}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22))
              ])),
              Expanded(
                child: Image.network(
                  product.images!.first,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
