import 'package:digifly/core/utils/app_routes.dart';
import 'package:digifly/core/utils/navigate.dart';
import 'package:digifly/generated/l10n.dart';

import 'setting_item.dart';
import 'space_container.dart';
import 'user_list_tile.dart';
import 'package:digifly/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_style.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          S.of(context).setting,
          style: AppStyle.style16font700black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SpaceContainer(),
              const UserListTile(),
              const SizedBox(height: 40),
              Text(S.of(context).setting, style: AppStyle.style14font500black),
              SettingItem(
                title: S.of(context).profile,
                icon: Assets.icons.profile,
                onTap: () {
                  context.pushNameed(AppRoutes.editAccountView);
                },
              ),
              SettingItem(
                  title: S.of(context).languages,
                  icon: Assets.icons.language,
                  isLangauge: true),
              const SizedBox(height: 40),
              Text(S.of(context).contact_us,
                  style: AppStyle.style14font500black),
              const SizedBox(height: 20),
              SettingItem(
                  title: S.of(context).call_us, icon: Assets.icons.contact),
              SettingItem(
                  title: S.of(context).about_us,
                  icon: Assets.icons.exclamation),
              const SizedBox(height: 40),
              SettingItem(
                  title: S.of(context).sign_out, icon: Assets.icons.signOut),
            ],
          ),
        ),
      ),
    );
  }
}
