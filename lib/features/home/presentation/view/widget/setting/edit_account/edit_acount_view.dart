import 'package:digifly/core/utils/app_button.dart';
import 'package:digifly/core/utils/app_colors.dart';
import 'package:digifly/core/utils/app_style.dart';
import 'package:digifly/core/utils/navigate.dart';
import 'package:digifly/features/home/presentation/controller/home/home_cubit.dart';
import 'package:digifly/features/home/presentation/view/widget/setting/edit_account/edit_account_item.dart';
import 'package:digifly/features/home/presentation/view/widget/setting/space_container.dart';
import 'package:digifly/gen/assets.gen.dart';
import 'package:digifly/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditAcountView extends StatelessWidget {
  const EditAcountView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<HomeCubit>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).edit_account,
            style: AppStyle.style16font700black,
          ),
          leading: Padding(
            padding: const EdgeInsets.all(1),
            child: GestureDetector(
              onTap: () {
                context.pop();
              },
              child: SvgPicture.asset(
                Assets.icons.backArrow,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SpaceContainer(),
                const SizedBox(height: 40),
                EditAccountItem(
                    title: S.of(context).email,
                    subtitle: cubit.email??""),
                const SizedBox(height: 40),
                BlocBuilder<HomeCubit, HomeState>(
                  buildWhen: (previous, current) =>
                      current is HomeEditFirstNameSuccess ||
                      current is HomeSaveDataSucess,
                  builder: (context, state) {
                    if (state is HomeEditFirstNameSuccess) {
                      return EditAccountItem(
                        controller: cubit.firstNameController,
                        title: S.of(context).first_name,
                        subtitle: cubit.initialFirstName,
                        isEdit: state.isEdit,
                        onChanged: (value) {
                          cubit.onChnage();
                        },
                      );
                    }
                    return EditAccountItem(
                      controller: cubit.firstNameController,
                      title: S.of(context).first_name,
                      subtitle: cubit.initialFirstName,
                      isEdit: cubit.isEditeFirstName,
                      onTap: () {
                        cubit.editFirstName();
                      },
                    );
                  },
                ),
                const SizedBox(height: 40),
                BlocBuilder<HomeCubit, HomeState>(
                  buildWhen: (previous, current) =>
                      current is HomeEditLastNameSuccess ||
                      current is HomeSaveDataSucess,
                  builder: (context, state) {
                    if (state is HomeEditLastNameSuccess) {
                      return EditAccountItem(
                        controller: cubit.lastNameController,
                        title: S.of(context).last_name,
                        subtitle: cubit.initialLastName,
                        isEdit: state.isEdit,
                        onChanged: (value) {
                          cubit.onChnage();
                        },
                      );
                    }
                    return EditAccountItem(
                      controller: cubit.lastNameController,
                      title: S.of(context).last_name,
                      subtitle: cubit.initialLastName,
                      isEdit: false,
                      onTap: () {
                        cubit.editLasttName();
                      },
                    );
                  },
                ),
                const SizedBox(height: 25),
                BlocBuilder<HomeCubit, HomeState>(
                  buildWhen: (previous, current) =>
                      current is HomeEditOnChangedSucess ||
                      current is HomeSaveDataLoading ||
                      current is HomeSaveDataSucess,
                  builder: (context, state) {
                    if (state is HomeEditOnChangedSucess) {
                      return SizedBox(
                          width: double.infinity,
                          child: AppButton(
                            title: S.of(context).save,
                            color: AppColors.primaryColor,
                            onPressed: () {
                              cubit.saveData();
                            },
                          ));
                    } else if (state is HomeSaveDataLoading) {
                      return  SizedBox(
                          width: double.infinity,
                          child: AppButton(
                            title: S.of(context).save,
                            color: AppColors.primaryColor,
                            isLoading: true,
                          ));
                    }
                    return  SizedBox(
                        width: double.infinity,
                        child: AppButton(
                          title: S.of(context).save,
                          color: Colors.grey,
                        ));
                  },
                )
              ],
            ),
          ),
        ));
  }
}
