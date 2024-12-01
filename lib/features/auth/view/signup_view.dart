import 'package:digifly/core/utils/app_routes.dart';
import 'package:digifly/core/utils/app_text_Form_filed.dart';
import 'package:digifly/core/utils/navigate.dart';
import 'package:digifly/gen/assets.gen.dart';
import 'package:digifly/generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/app_button.dart';
import '../../../core/utils/app_style.dart';
import 'widget/do_have_account.dart';
import 'widget/logo.dart';
import 'widget/password_text_field.dart';

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
              AppTextFormFiled(
                  hint: S.of(context).username, icon: Assets.icons.person),
              const SizedBox(height: 24),
              AppTextFormFiled(
                  hint: S.of(context).email, icon: Assets.icons.mail),
              const SizedBox(height: 24),
              PasswordTextField(hintText: S.of(context).password),
              const SizedBox(height: 24),
              PasswordTextField(hintText: S.of(context).confirm_password),
              const SizedBox(height: 40),
              SizedBox(
                  width: double.infinity,
                  child: AppButton(
                    title: S.of(context).sign_up,
                    onPressed: () {
                      context.pushNameed(AppRoutes.singinView);
                    },
                  )),
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
