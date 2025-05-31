import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopp/Detailspage/presentation/ViewModel/item_cubit.dart';
import 'package:shopp/Homepage/data/Models/colthe_model/product.dart';

import 'package:shopp/Homepage/presentation/view/wedget/itemcard.dart';
import 'package:shopp/constant.dart';
import 'package:shopp/core/goroute.dart';

class Mylovescreen extends StatelessWidget {
  const Mylovescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemCubit, ItemState>(
      builder: (BuildContext context, state) {
        final cart = BlocProvider.of<ItemCubit>(context, listen: false);
        List<Product> pro = cart.product;
        return Column(
          children: [
            const Text(
              "My Favourite item",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 30,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: kDefaultPaddin,
                    crossAxisSpacing: kDefaultPaddin,
                  ),
                  itemCount: pro.length,
                  itemBuilder: (context, int) {
                 
                    return ItemCard(
                
                      product: pro[int],
                      function: () {
                        GoRouter.of(context)
                            .push('${Goroute.KDetailspage}/${pro[int].id}');
                      },
                    );
                  }),
            ),
          ],
        );
      },
    );
  }
}
