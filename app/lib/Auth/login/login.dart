import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopp/Auth/login/cubit/logincubit/shpo_cubit.dart';

import 'wedget/Loginbody.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Logincubit(),
      child: const Scaffold(
        body: Loginbody(),
      ),
    );
  }
}
