part of 'signin_cubit.dart';

@immutable
sealed class SigninState {}

final class SigninInitial extends SigninState {}

final class SigninLoadingState extends SigninState {}

final class SigninSuccessState extends SigninState {}

final class SigninFailedStaet extends SigninState {
  final String errorMessege;

  SigninFailedStaet({required this.errorMessege});
}
