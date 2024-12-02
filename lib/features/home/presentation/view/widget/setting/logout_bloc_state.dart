import 'package:digifly/core/utils/app_colors.dart';
import 'package:digifly/core/utils/app_routes.dart';
import 'package:digifly/core/utils/navigate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../gen/assets.gen.dart';
import '../../../../../../generated/l10n.dart';
import '../../../controller/home/home_cubit.dart';
import 'setting_item.dart';

class LogoutBlocStates extends StatelessWidget {
  const LogoutBlocStates({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<HomeCubit>(context);

    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is HomeLogOutLoading || current is HomeLogOutSucess,
      builder: (context, state) {
        if (state is HomeLogOutLoading) {
          return Stack(
            children: [
              SettingItem(
                title: S.of(context).sign_out,
                icon: Assets.icons.signOut,
                onTap: () {
                  cubit.signOut();
                },
              ),
              const Positioned(
                right: 25,
                top: 36,
                child: Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: SizedBox(
                    height: 16,
                    width: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          );
        } else if (state is HomeLogOutSucess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.pushReplacementNamed(AppRoutes.singinView);
          });
        }
        return SettingItem(
          title: S.of(context).sign_out,
          icon: Assets.icons.signOut,
          onTap: () {
            cubit.signOut();
          },
        );
      },
    );
  }
}
