import 'package:digifly/features/auth/presentation/controller/signin/signin_cubit.dart';
import 'package:digifly/features/auth/presentation/controller/signup/signup_cubit.dart';
import 'package:digifly/features/home/presentation/controller/home/home_cubit.dart';
import 'package:digifly/features/home/presentation/view/home_view.dart';
import 'package:digifly/features/home/presentation/view/widget/setting/edit_account/edit_acount_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/presentation/view/signin_view.dart';
import '../../features/auth/presentation/view/signup_view.dart';

class AppRoutes {
  static const String singinView = '/singinView';
  static const String signupView = '/signupView';
  static const String homeView = '/homepage';
  static const String editAccountView = '/editAccountView';
  static HomeCubit homeCubit = HomeCubit();
  SigninCubit signinCubit = SigninCubit();
  static Route generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case singinView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<SigninCubit>.value(
            value: SigninCubit(),
            child: const SigninView(),
          ),
        );
      case signupView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<SignupCubit>.value(
            value: SignupCubit(),
            child: const SignupView(),
          ),
        );
      case "/" || homeView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<HomeCubit>.value(
            value: homeCubit,
            child: const HomeView(),
          ),
        );
      case editAccountView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<HomeCubit>.value(
            value: homeCubit,
            child: const EditAcountView(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text("No route defind for ${setting.name}"),
            ),
          ),
        );
    }
  }
}
