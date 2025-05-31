import 'package:flutter/material.dart';

class addShoppingcard extends StatelessWidget {
  const addShoppingcard({super.key,});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      width: 58,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.cyan),
      ),
      child: IconButton(
          onPressed: () {
            
          }, icon: const Icon(Icons.add_shopping_cart_outlined)),
    );
  }
}
