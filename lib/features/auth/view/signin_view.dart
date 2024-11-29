import 'package:digifly/core/utils/app_button.dart';
import 'package:digifly/core/utils/app_colors.dart';
import 'package:digifly/core/utils/app_style.dart';
import 'package:digifly/core/utils/app_text_Form_filed.dart';
import 'package:digifly/features/auth/view/widget/continue_with_google.dart';
import 'package:digifly/features/auth/view/widget/forget_password_row.dart';
import 'package:digifly/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import 'widget/logo.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Logo(),
          const SizedBox(height: 40),
          Text("Sign in to continue", style: AppStyle.style18font600black),
          const SizedBox(height: 40),
          AppTextFormFiled(hint: "Emai", icon: Assets.icons.mail),
          const SizedBox(height: 24),
          AppTextFormFiled(hint: "Password", icon: Assets.icons.lockSolid1),
          const SizedBox(height: 24),
          const ForgetPasswordRow(),
          const SizedBox(height: 40),
          const SizedBox(
              width: double.infinity, child: AppButton(title: "Login")),
          const SizedBox(height: 24),
          Text("Or",
              style:
                  AppStyle.style14font500black.copyWith(color: AppColors.grey)),
          const SizedBox(height: 24),
          const ContinueWithGoogle()
        ],
      ),
    ));
  }
}
