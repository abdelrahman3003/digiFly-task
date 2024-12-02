import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:digifly/core/utils/sharded_pref.dart';
import 'package:digifly/features/home/presentation/controller/home/home_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.homeCubit) : super(SigninInitial());
  final HomeCubit homeCubit;
  final FirebaseAuth auth = FirebaseAuth.instance;
  UserCredential? userCredential;
  String? errorMessege;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> signInWithEmail() async {
    try {
      userCredential = await auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      AppService.sharedPreferences.setString(ShardedPrefKey.step, "1");
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
