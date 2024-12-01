import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(SigninInitial());
  final FirebaseAuth auth = FirebaseAuth.instance;
  UserCredential? userCredential;
  String? errorMessege;
  void signInWithEmail(String email, String password) async {
    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      errorMessege = e.toString();
    } catch (e) {
      errorMessege = e.toString();
    }
  }

  emitSignInStates(String email, String password) {
    emit(SigninLoadingState());
    signInWithEmail(email, password);
    if (userCredential != null) {
      emit(SigninSuccessState());
    } else {
      emit(SigninFailedStaet(errorMessege: errorMessege!));
    }
  }
}
