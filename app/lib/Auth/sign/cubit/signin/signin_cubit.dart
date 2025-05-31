import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'signin_state.dart';

class SigninCubit extends Cubit<signinstate> {
  SigninCubit() : super(SigninIntail()) {
    username = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    formKey = GlobalKey();
  }

  late final GlobalKey<FormState> formKey;
  late final TextEditingController username;
  late final TextEditingController email;
  late final TextEditingController password;

  Future<void> signin() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    emit(Signinloading());
    try {
      try {
        UserCredential credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text.trim(),
          password: password.text,
        );
        FirebaseAuth.instance.currentUser!.sendEmailVerification();

        print('success2');
        emit(Signinsucces());
      } on FirebaseAuthException catch (e) {
        String errorMessage;
        if (e.code == 'weak-password') {
          errorMessage = 'The password is too weak.';
        } else if (e.code == 'email-already-in-use') {
          errorMessage = 'The email is already in use.';
        } else {
          errorMessage = 'Authentication failed: ${e.message}';
        }
        print("$e");
        emit(Signinfail(errormessage: errorMessage));
        return;
      }
    } catch (e) {
      emit(Signinfail(errormessage: 'Unexpected error: $e'));
    }
  }
}
