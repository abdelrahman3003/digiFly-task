import 'package:digifly/features/home/home_view.dart';
import 'package:digifly/features/home/widget/setting/edit_account/edit_acount_view.dart';
import 'package:flutter/material.dart';

import '../../features/auth/view/signin_view.dart';
import '../../features/auth/view/signup_view.dart';

class AppRoutes {
  static const String singinView = '/singinView';
  static const String signupView = '/signupView';
  static const String homeView = '/homepage';
  static const String editAccountView = '/editAccountView';
  static Route generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case  singinView:
        return MaterialPageRoute(builder: (context) => const SigninView());
      case signupView:
        return MaterialPageRoute(builder: (context) => const SignupView());
      case "/":
        return MaterialPageRoute(builder: (context) => const HomeView());
              case editAccountView:
        return MaterialPageRoute(builder: (context) => const EditAcountView());
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
