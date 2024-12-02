part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeGetUserLoading extends HomeState {}

final class HomeGetUserSucess extends HomeState {}

final class HomeGetUserFailed extends HomeState {}

final class HomeLogOutLoading extends HomeState {}

final class HomeLogOutSucess extends HomeState {}

final class HomeLogOutFailed extends HomeState {}

final class HomeSaveDataLoading extends HomeState {}

final class HomeSaveDataSucess extends HomeState {}

final class HomeEditFirstNameSuccess extends HomeState {
  final bool isEdit;

  HomeEditFirstNameSuccess({required this.isEdit});
}

final class HomeEditLastNameSuccess extends HomeState {
  final bool isEdit;

  HomeEditLastNameSuccess({required this.isEdit});
}

final class HomeEditOnChangedSucess extends HomeState {
    final bool isButtonEnabled ;

  HomeEditOnChangedSucess({required this.isButtonEnabled});
}
