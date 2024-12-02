import 'package:digifly/core/utils/app_button.dart';
import 'package:digifly/core/utils/app_routes.dart';
import 'package:digifly/core/utils/app_style.dart';
import 'package:digifly/core/utils/app_text_Form_filed.dart';
import 'package:digifly/core/utils/navigate.dart';
import 'package:digifly/features/auth/presentation/controller/signin/signin_cubit.dart';
import 'package:digifly/features/auth/presentation/view/widget/forget_password_row.dart';
import 'package:digifly/features/auth/presentation/view/widget/password_text_field.dart';
import 'package:digifly/gen/assets.gen.dart';
import 'package:digifly/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninForm extends StatelessWidget {
  const SigninForm({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SigninCubit>(context);
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
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
          const ForgetPasswordRow(),
          const SizedBox(height: 40),
          BlocBuilder<SigninCubit, SigninState>(
            builder: (context, state) {
              if (state is SigninLoadingState) {
                return SizedBox(
                    width: double.infinity,
                    child: AppButton(
                      title: S.of(context).login,
                      isLoading: true,
                    ));
              } else if (state is SigninFailedState) {
                return Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox(
                        width: double.infinity,
                        child: AppButton(
                          title: S.of(context).login,
                          onPressed: () {
                            cubit.emitSignInStates();
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
              } else if (state is SigninSuccessState) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  context.pushReplacementNamed(AppRoutes.homeView);
                });
              }
              return SizedBox(
                  width: double.infinity,
                  child: AppButton(
                    title: S.of(context).login,
                    onPressed: () {
                      cubit.emitSignInStates();
                    },
                  ));
            },
          ),
        ],
      ),
    );
  }
}
