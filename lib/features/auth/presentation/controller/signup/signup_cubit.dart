import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  final FirebaseAuth auth = FirebaseAuth.instance;
  UserCredential? userCredential;
  String? errorMessege;
  void registerWithEmail(String email, String password) async {
    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      errorMessege = e.toString();
    } catch (e) {
      errorMessege = e.toString();
    }
  }

  emitSignUpStates(String email, String password) {
    emit(SignupLoadingState());
    registerWithEmail(email, password);
    if (userCredential != null) {
      emit(SignupSuccessState());
    } else {
      emit(SignupFailedStaet(errorMessege: errorMessege!));
    }
  }
}
