import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopp/Auth/login/login.dart';
import 'package:shopp/Auth/sign/Signin.dart';
import 'package:shopp/Detailspage/Detailspage.dart';
import 'package:shopp/Homepage/presentation/view/Homepage.dart';
import 'package:shopp/Homepage/presentation/viewModel/Clothescubit/colthescubit_cubit.dart';
import 'package:shopp/Homepage/presentation/viewModel/screens/screens_cubit.dart'
    show ScreensCubit;

abstract class Goroute {
  static const Klogin = '/';
  static const Ksign = '/signin';
  static const KHomepage = '/homepage';
  static const KDetailspage = '/detailspage';
  static const KCardpage = '/Cardspage';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: Klogin,
        builder: (context, state) {
          final user = FirebaseAuth.instance.currentUser;
          return (user != null && user.emailVerified)
              ? const Homepage()
              : const Login();
        },
      ),
      GoRoute(
        path: Ksign,
        builder: (context, state) => const Signin(),
      ),
      GoRoute(
        path: KHomepage,
        builder: (context, state) => const Homepage(),
      ),
      GoRoute(
        path: '$KDetailspage/:id',
        builder: (context, state) {
          final productId =
              int.tryParse(state.pathParameters['id'] ?? '0') ?? 0;
          final clothesCubit = context.read<ColthescubitCubit>();
          final currentProduct = clothesCubit.getProductById(productId);

          if (currentProduct != null) {
            return Detailspage(product: currentProduct);
          }

          return BlocBuilder<ColthescubitCubit, ColthescubitState>(
            builder: (context, state) {
              if (state is ColthescubitSuccess) {
                final product = state.products.firstWhere(
                  (p) => p.id == productId,
                  orElse: () => state.products.first,
                );
                return Detailspage(product: product);
              }

              if (state is ColthescubitFaliure) {
                return Scaffold(
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Error: ${state.errorMessage}'),
                        ElevatedButton(
                          onPressed: () => clothesCubit.fetchCategoryProducts(
                            context.read<ScreensCubit>().state,
                          ),
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            },
          );
        },
      ),
    ],
    // Add error handling
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Route not found: ${state.error}'),
      ),
    ),
  );
}
