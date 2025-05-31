import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopp/Detailspage/presentation/ViewModel/item_cubit.dart';
import 'package:shopp/Homepage/data/Repo/home_Repo_impelemtation.dart';
import 'package:shopp/Homepage/presentation/viewModel/Clothescubit/colthescubit_cubit.dart';

import 'package:shopp/constant.dart';
import 'package:shopp/core/Api_server.dart';
import 'package:shopp/core/goroute.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCjBZVBbyNTey_R4_F_FUOoO0nUo8kNwmk",
      appId: "1:1033775597248:android:d68b2e0067f1ad62208f25",
      messagingSenderId: "1033775597248",
      projectId: "shopping-fd71e",
    ),
  );

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const ShoppingApp(),
    ),
  );
}

class ShoppingApp extends StatefulWidget {
  const ShoppingApp({super.key});

  @override
  State<ShoppingApp> createState() => _ShoppingAppState();
}

class _ShoppingAppState extends State<ShoppingApp> {
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        debugPrint('User is currently signed out!');
      } else {
        debugPrint('User is signed in!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ColthescubitCubit(
            HomeRepoImpelemtation(apiServer: ApiServer(Dio())),
          ),
        ),
        BlocProvider(create: (_) => ItemCubit()),
      ],
      child: MaterialApp.router(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        routerConfig: Goroute.router,
        theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
