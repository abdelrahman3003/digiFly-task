
import 'package:digifly/core/utils/app_routes.dart';
import 'package:digifly/core/utils/navigate.dart';
import 'package:digifly/features/home/presentation/controller/home/home_cubit.dart';
import 'package:digifly/features/home/presentation/view/widget/home_details/home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is HomeGetUserLoading ||
          current is HomeGetUserFailed ||
          current is HomeGetUserSucess,
      builder: (context, state) {
        if (state is HomeGetUserSucess) {
          return const HomeBody();
        } else if (state is HomeGetUserFailed) {

          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.pushReplacementNamed(AppRoutes.singinView);
          });
        }
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
