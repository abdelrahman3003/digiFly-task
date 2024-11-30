import 'package:digifly/core/utils/app_button.dart';
import 'package:digifly/core/utils/app_colors.dart';
import 'package:digifly/core/utils/app_style.dart';
import 'package:digifly/core/utils/app_text_Form_filed.dart';
import 'package:digifly/core/utils/navigate.dart';
import 'package:digifly/features/auth/view/widget/continue_with_google.dart';
import 'package:digifly/features/auth/view/widget/do_have_account.dart';
import 'package:digifly/features/auth/view/widget/forget_password_row.dart';
import 'package:digifly/features/auth/view/widget/password_text_field.dart';
import 'package:digifly/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_routes.dart';
import 'widget/logo.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

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
            Text("Sign in to continue", style: AppStyle.style18font600black),
            const SizedBox(height: 40),
            AppTextFormFiled(hint: "Emai", icon: Assets.icons.mail),
            const SizedBox(height: 24),
            const PasswordTextField(hintText: "Password"),
            const SizedBox(height: 24),
            const ForgetPasswordRow(),
            const SizedBox(height: 40),
            SizedBox(
                width: double.infinity,
                child: AppButton(
                  title: "Login",
                  onPressed: () {
                    context.pushNameed(AppRoutes.homeView);
                  },
                )),
            const SizedBox(height: 24),
            Text("Or",
                style: AppStyle.style14font500black
                    .copyWith(color: AppColors.grey)),
            const SizedBox(height: 24),
            const ContinueWithGoogle(),
            const SizedBox(height: 40),
            DoHaveAccount(
              title: "Don’t have an account ?",
              subtitle: "Sign up",
              onTap: () {
                context.pushNameed(AppRoutes.signupView);
              },
            )
          ],
        ),
      ),
    ));
  }
}
