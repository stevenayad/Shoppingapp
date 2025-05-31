import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopp/Auth/login/cubit/logincubit/shpo_cubit.dart';
import 'package:shopp/Auth/login/wedget/RestserButton.dart';
import 'package:shopp/Auth/login/wedget/custominputfeild.dart';
import 'package:shopp/constant.dart';
import 'package:shopp/core/goroute.dart';
import 'package:shopp/wedget/buildlabel.dart';
import 'package:shopp/wedget/customButton.dart';

import '../cubit/logincubit/shpo_state.dart';

class Loginbody extends StatefulWidget {
  const Loginbody({super.key});

  @override
  State<Loginbody> createState() => _LoginbodyState();
}

class _LoginbodyState extends State<Loginbody> {
  @override
  Widget build(BuildContext context) {
    bool isactive = false;
    final shpoCubit = BlocProvider.of<Logincubit>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(kDefaultPaddin),
      child: BlocListener<Logincubit, Loginstate>(
        listener: (context, state) {
          if (state is loginloading) {
            setState(() {
              isactive = true;
            });
          } else if (state is loginfail) {
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
            ).show();
          } else if (state is loginsucces) {
            setState(() {
              isactive = false;
            });
            GoRouter.of(context).push(Goroute.KHomepage);
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
                  "Login",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                ),
                const SizedBox(height: 10),
                buildLabel("Email"),
                Inputextfield(
                  hint: 'Email',
                  controller: shpoCubit.email,
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
                ),
                buildLabel("Password"),
                Inputextfield(
                  hint: 'Password',
                  controller: shpoCubit.password,
                  validator: (value) =>
                      value!.length < 6 ? "Password too short" : null,
                  isappear: true,
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    shpoCubit.Resetpassword(context);
                  },
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forget password ?",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w200,
                          color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Center(
                    child: CustomButton(
                  child: isactive
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text("Login in"),
                  onPressed: () {
                    shpoCubit.login();
                  },
                )),
                const SizedBox(height: 25),
                const Restserbutton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
