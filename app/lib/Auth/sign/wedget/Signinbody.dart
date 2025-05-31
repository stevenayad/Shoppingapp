import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopp/Auth/login/wedget/custominputfeild.dart';
import 'package:shopp/Auth/sign/cubit/signin/signin_cubit.dart';
import 'package:shopp/Auth/sign/cubit/signin/signin_state.dart';
import 'package:shopp/constant.dart';
import 'package:shopp/core/goroute.dart';
import 'package:shopp/wedget/buildlabel.dart';
import 'package:shopp/wedget/customButton.dart';

class Signinbody extends StatefulWidget {
  const Signinbody({super.key});

  @override
  _SigninbodyState createState() => _SigninbodyState();
}

class _SigninbodyState extends State<Signinbody> {
  bool isactive = false;

  @override
  Widget build(BuildContext context) {
    final shpoCubit = BlocProvider.of<SigninCubit>(context, listen: true);

    return Padding(
      padding: const EdgeInsets.all(kDefaultPaddin),
      child: BlocListener<SigninCubit, signinstate>(
        listener: (context, state) {
          if (state is Signinloading) {
            setState(() {
              isactive = true;
            });
          } else if (state is Signinfail) {
            setState(() {
              isactive = false;
            });
            AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              borderSide: const BorderSide(
                color: Colors.red,
                width: 2,
              ),
              title: 'ERROR',
              desc: state.errormessage,
              btnOkOnPress: () {},
            ).show();
          } else if (state is Signinsucces) {
            setState(() {
              isactive = false;
            });
            GoRouter.of(context).push(Goroute.Klogin);
          }
        },
        child: SingleChildScrollView(
          child: Form(
            key: shpoCubit.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Login in to app to shopping Esaily",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Colors.blueGrey,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.asset(
                        "assets/images/Screenshot 2025-03-28 204008.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  "Sign In",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                ),
                const SizedBox(height: 10),
                buildLabel("User Name"),
                Inputextfield(
                  validator: (value) => value!.isEmpty ? "Required" : null,
                  hint: 'User Name',
                  controller: shpoCubit.username,
                ),
                const SizedBox(height: 10),
                buildLabel("Email"),
                Inputextfield(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email';
                    }
                    String pattern =
                        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
                    RegExp regex = RegExp(pattern);
                    if (!regex.hasMatch(value.trim())) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                  hint: 'Email',
                  controller: shpoCubit.email,
                ),
                const SizedBox(height: 10),
                buildLabel("Password"),
                Inputextfield(
                  validator: (value) =>
                      value!.length < 6 ? "Password too short" : null,
                  hint: 'Password',
                  controller: shpoCubit.password,
                  isappear: true,
                ),
                const SizedBox(height: 10),
                Center(
                  child: CustomButton(
                    child: isactive
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text("Sign In"),
                    onPressed: () {
                      if (shpoCubit.formKey.currentState!.validate())
                        shpoCubit.signin();
                    },
                  ),
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
