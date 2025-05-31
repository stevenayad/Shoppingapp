import 'package:flutter/material.dart';
import 'package:shopp/Homepage/data/Models/colthe_model/product.dart';
import 'package:shopp/Homepage/presentation/view/wedget/love.dart';
import 'package:shopp/constant.dart';
 class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.product,
    required this.function,
    this.isselectd = false, 
  });

  final bool isselectd;
  final Product product;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
                border: isselectd
                    ? Border.all(color: Colors.blue, width: 2)
                    : null, 
              ),
              child: product.images?.isNotEmpty ?? false
                  ? Image.network(
                      product.images!.first,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.broken_image),
                    )
                  : const Icon(Icons.image_not_supported),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              product.title ?? 'No title',
              style: const TextStyle(fontSize: 12, color: kTextColor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${product.price?.toStringAsFixed(2) ?? '0.00'}",
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
              Love(pro: product),
            ],
          ),
        ],
      ),
    );
  }
}
