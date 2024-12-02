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
