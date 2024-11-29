import 'package:flutter/material.dart';

import '../../features/auth/view/signin_view.dart';

class AppRoutes {

  static const String singinView = '/singinView';
  static const String signupView = '/signupView';
  static const String HomeView = '/homepage';
  static Route generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case singinView:
        return MaterialPageRoute(builder: (context) => const SigninView());

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
