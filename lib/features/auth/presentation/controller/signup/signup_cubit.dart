import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  static SignupCubit get(context) => BlocProvider.of(context);
  final FirebaseAuth auth = FirebaseAuth.instance;
  UserCredential? userCredential;
  String? errorMessege;
  TextEditingController usernameController =
      TextEditingController(text: "abdo14");
  TextEditingController emailController =
      TextEditingController(text: "abdo14@gmail.com");
  TextEditingController passwordController =
      TextEditingController(text: "123456");
  TextEditingController confirmPasswordController =
      TextEditingController(text: "123456");

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<void> registerWithEmail() async {
    if (!formKey.currentState!.validate()) return;
    try {
      userCredential = await auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          errorMessege = "This email is already in use.";
          break;
        case 'invalid-email':
          errorMessege = "The email address is not valid.";
          break;
        case 'weak-password':
          errorMessege = "The password is too weak.";
          break;
        default:
          errorMessege = e.message ?? "An unknown error occurred.";
          break;
      }
    } catch (e) {
      errorMessege = "An unexpected error occurred. Please try again.";
    }
  }

  Future<void> emitSignUpStates() async {
    if (formKey.currentState!.validate()) {
      emit(SignupLoadingState());
      await registerWithEmail();
      if (userCredential != null) {
        emit(SignupSuccessState());
      } else {
        emit(SignupFailedStaet(
            errorMessege: errorMessege ?? "An unknown error occurred."));
      }
    }
  }
}
