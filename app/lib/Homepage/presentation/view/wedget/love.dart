import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopp/Detailspage/presentation/ViewModel/item_cubit.dart';
import 'package:shopp/Homepage/data/Models/colthe_model/product.dart';

class Love extends StatelessWidget {
  const Love({super.key, required this.pro});
  final Product pro;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemCubit, ItemState>(
      builder: (context, state) {
        final cart = BlocProvider.of<ItemCubit>(context);
        final isFavorited = cart.contains(pro);

        return GestureDetector(
          onTap: () {
            if (!isFavorited) {
              cart.add(pro);
            } else {
              cart.remove(pro);
            }
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            width: 39,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
            child: Icon(
              isFavorited ? Icons.favorite : Icons.favorite_border,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
