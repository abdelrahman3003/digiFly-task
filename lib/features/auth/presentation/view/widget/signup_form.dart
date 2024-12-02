import 'package:digifly/core/utils/app_button.dart';
import 'package:digifly/core/utils/app_routes.dart';
import 'package:digifly/core/utils/app_style.dart';
import 'package:digifly/core/utils/app_text_Form_filed.dart';
import 'package:digifly/core/utils/navigate.dart';
import 'package:digifly/features/auth/presentation/controller/signup/signup_cubit.dart';
import 'package:digifly/features/auth/presentation/view/widget/password_text_field.dart';
import 'package:digifly/gen/assets.gen.dart';
import 'package:digifly/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SignupCubit>(context);
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          AppTextFormFiled(
            hint: S.of(context).username,
            icon: Assets.icons.person,
            controller: cubit.usernameController,
          ),
          const SizedBox(height: 24),
          AppTextFormFiled(
            hint: S.of(context).email,
            icon: Assets.icons.mail,
            controller: cubit.emailController,
          ),
          const SizedBox(height: 24),
          PasswordTextField(
            hintText: S.of(context).password,
            controller: cubit.passwordController,
          ),
          const SizedBox(height: 24),
          PasswordTextField(
            hintText: S.of(context).confirm_password,
            controller: cubit.confirmPasswordController,
          ),
          const SizedBox(height: 40),
          BlocBuilder<SignupCubit, SignupState>(
            builder: (context, state) {
              if (state is SignupLoadingState) {
                return SizedBox(
                    width: double.infinity,
                    child: AppButton(
                      title: S.of(context).sign_up,
                      isLoading: true,
                    ));
              }
              if (state is SignupFailedStaet) {
                return Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox(
                        width: double.infinity,
                        child: AppButton(
                          title: S.of(context).sign_up,
                          onPressed: () {
                            cubit.emitSignUpStates();
                          },
                        )),
                    Positioned(
                      bottom: -24,
                      child: Text(
                        state.errorMessege,
                        style: AppStyle.style12font600grey
                            .copyWith(color: Colors.red),
                      ),
                    )
                  ],
                );
              } else if (state is SignupSuccessState) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  context.pushReplacementNamed(AppRoutes.singinView);
                });
              }
              return SizedBox(
                  width: double.infinity,
                  child: AppButton(
                    title: S.of(context).sign_up,
                    onPressed: () {
                      cubit.emitSignUpStates();
                    },
                  ));
            },
          ),
        ],
      ),
    );
  }
}
