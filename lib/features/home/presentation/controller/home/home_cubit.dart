
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    checkLoginStatus();
  }
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  bool? isLoagin;
  checkLoginStatus() async {
    emit(HomeGetUserLoading());
    user = auth.currentUser;
    if (user != null) {
      emit(HomeGetUserSucess());
    } else {
      emit(HomeGetUserFailed());
    }
  }

  Future<void> signOut() async {
    emit(HomeLogOutLoading());
    try {
      await auth.signOut();
      emit(HomeLogOutSucess());
    } catch (e) {

      emit(HomeLogOutFailed());
    }
  }
}
