import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopp/Homepage/data/Models/colthe_model/product.dart';
import 'package:shopp/Homepage/presentation/view/wedget/itemcard.dart';
import 'package:shopp/Homepage/presentation/viewModel/Clothescubit/colthescubit_cubit.dart';
import 'package:shopp/Homepage/presentation/viewModel/screens/screens_cubit.dart';
import 'package:shopp/constant.dart';
import 'package:shopp/core/goroute.dart';
import 'package:shopp/wedget/customErrorwideget.dart';

class Displayitems extends StatelessWidget {
  const Displayitems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ColthescubitCubit, ColthescubitState>(
      listener: (context, state) {
        if (state is ColthescubitFaliure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      builder: (context, state) {
        if (state is ColthescubitInitial || state is ColthescubitLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ColthescubitFaliure) {
          return Customerrorwideget(
            errorMessage: state.errorMessage,
            onRetry: () => context.read<ColthescubitCubit>()
              .fetchCategoryProducts(context.read<ScreensCubit>().state),
          );
        }

        if (state is ColthescubitSuccess) {
          if (state.products.isEmpty) {
            return const Center(child: Text('No products found'));
          }

          return GridView.builder(
            padding: const EdgeInsets.all(kDefaultPaddin),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: kDefaultPaddin,
              crossAxisSpacing: kDefaultPaddin,
              childAspectRatio: 0.75,
            ),
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              final product = state.products[index];
              return ItemCard(
                product: product,
                isselectd: product.id == 
                  context.read<ColthescubitCubit>().selectedProductId,
                function: () => _navigateToDetails(context, product),
              );
            },
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  void _navigateToDetails(BuildContext context, Product product) {
    if (product.id == null) return;
    
    final cubit = context.read<ColthescubitCubit>();
    cubit.setSelectedProductId(product.id!);
    
    GoRouter.of(context).push(
      '${Goroute.KDetailspage}/${product.id}',
    ).then((_) {
      cubit.clearSelectedProductId();
    });
  }
}