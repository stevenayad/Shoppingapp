import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shopp/Auth/login/cubit/logincubit/shpo_state.dart';

class Logincubit extends Cubit<Loginstate> {
  Logincubit() : super(loginInitial()) {
    email = TextEditingController();
    password = TextEditingController();
    formKey = GlobalKey();
  }
  late final GlobalKey<FormState> formKey;
  late final TextEditingController email;
  late final TextEditingController password;

  Future<void> login() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    emit(loginloading());
    try {
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.text, password: password.text);
      if (credential.user!.emailVerified) {
        emit(loginsucces());
      } else {
        emit(loginfail(errormessage: "Verifition your email"));
      }
    } on FirebaseAuthException catch (e) {
      String error = '';
      if (e.code == 'user-not-found') {
        error = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        error = 'Wrong password provided for that user.';
      }
      emit(loginfail(errormessage: error));
    }
  }

  Future<void> Resetpassword(context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Go to email and Resest password"),
        duration: Duration(seconds: 4),
      ));
    } catch (on) {
      emit(loginfail(errormessage: "Enter your email"));
    }
  }

  @override
  Future<void> close() {
    email.dispose();
    password.dispose();
    return super.close();
  }
}
