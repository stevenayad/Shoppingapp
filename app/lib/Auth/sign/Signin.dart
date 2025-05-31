import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopp/Auth/sign/cubit/signin/signin_cubit.dart';
import 'wedget/Signinbody.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SigninCubit(),
      child: const Scaffold(
        body: Signinbody(),
      ),
    );
  }
}
