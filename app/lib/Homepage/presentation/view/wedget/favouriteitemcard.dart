import 'package:flutter/material.dart';
import 'package:shopp/Homepage/data/Models/colthe_model/product.dart';
import 'package:shopp/constant.dart';

class Favouriteitemcard extends StatelessWidget {
  const Favouriteitemcard({super.key, required this.product});
  
  final Product product; 
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200], 
                borderRadius: BorderRadius.circular(16),
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
          const SizedBox(height: 8),
          Text(
            product.title ?? 'No Title',
            style: const TextStyle(fontSize: 12, color: kTextColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "\$${product.price?.toStringAsFixed(2) ?? '0.00'}",
            style: const TextStyle(
              fontSize: 12, 
              fontWeight: FontWeight.w600
            ),
          ),
        ],
      ),
    );
  }
}