import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(SigninInitial());

  final FirebaseAuth auth = FirebaseAuth.instance;
  UserCredential? userCredential;
  String? errorMessege;

  TextEditingController emailController =
      TextEditingController(text: "abdo@gmail.com");
  TextEditingController passwordController =
      TextEditingController(text: "12345");

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> signInWithEmail() async {
    try {
      userCredential = await auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      log("Sign-in successful: ${userCredential!.user?.email}");
    } on FirebaseAuthException catch (e) {
      log("FirebaseAuthException: ${e.code}");
      switch (e.code) {
        case 'invalid-credential':
          errorMessege = "The email address or password is not valid.";
        case 'invalid-email':
          errorMessege = "The email address is not valid.";
          break;
        case 'user-not-found':
          errorMessege = "No user found for this email.";
          break;
        case 'wrong-password':
          errorMessege = "Incorrect password.";
          break;
        default:
          errorMessege = e.message ?? "An unknown error occurred.";
          break;
      }
    } catch (e) {
      log("Unknown exception: $e");
      errorMessege = "An unexpected error occurred. Please try again.";
    }
  }

  Future<void> emitSignInStates() async {
    if (formKey.currentState!.validate()) {
      emit(SigninLoadingState());
      await signInWithEmail();
      if (userCredential != null) {
        emit(SigninSuccessState());
      } else {
        emit(SigninFailedState(
          errorMessege:
              errorMessege ?? "An unknown error occurred. Please try again.",
        ));
      }
    }
  }
}
