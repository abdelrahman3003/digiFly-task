import 'package:digifly/core/utils/app_routes.dart';
import 'package:digifly/core/utils/navigate.dart';
import 'package:digifly/features/auth/presentation/view/widget/signup_form.dart';
import 'package:digifly/generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_style.dart';
import 'widget/do_have_account.dart';
import 'widget/logo.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 120),
              const Logo(),
              const SizedBox(height: 40),
              Text(S.of(context).create_account,
                  style: AppStyle.style18font600black),
              const SizedBox(height: 40),
              const SignupForm(),
              const SizedBox(height: 60),
              DoHaveAccount(
                title: S.of(context).Already_have,
                subtitle: S.of(context).login,
                onTap: () {
                  context.pushNameed(AppRoutes.singinView);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
