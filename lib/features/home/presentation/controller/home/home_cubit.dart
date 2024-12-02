import 'package:bloc/bloc.dart';
import 'package:digifly/core/utils/sharded_pref.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    inilData();
  }
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  bool? isLoagin;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  bool isEditeFirstName = false;
  bool isEditeLastName = false;
  late String initialFirstName;
  late String initialLastName;
  inilData() {
    checkLoginStatus();
    initialFirstName = "Ahmed";
    initialLastName = "Alaa";
    firstNameController = TextEditingController(text: initialFirstName);
    lastNameController = TextEditingController(text: initialLastName);
  }

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
      AppService.sharedPreferences.setString(ShardedPrefKey.step, "0");
      emit(HomeLogOutSucess());
    } catch (e) {
      emit(HomeLogOutFailed());
    }
  }

  editFirstName() {
    firstNameController.text = initialFirstName;
    emit(HomeEditFirstNameSuccess(isEdit: true));
  }

  editLasttName() {
    lastNameController.text = initialLastName;
    emit(HomeEditLastNameSuccess(isEdit: true));
  }

  onChnage() {
    bool isButtonEnabled = firstNameController.text != initialFirstName ||
        lastNameController.text != initialLastName;
    emit(HomeEditOnChangedSucess(isButtonEnabled: isButtonEnabled));
  }

  saveData() async {
    emit(HomeSaveDataLoading());
    initialFirstName = firstNameController.text;
    initialLastName = lastNameController.text;
    await Future.delayed(const Duration(milliseconds: 800));
    emit(HomeSaveDataSucess());
  }
}
