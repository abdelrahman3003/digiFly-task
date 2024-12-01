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
          "Setting",
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
              Text("Setting", style: AppStyle.style16font700black),
              SettingItem(title: "Profile", icon: Assets.icons.profile),
              SettingItem(
                  title: "Languages",
                  icon: Assets.icons.language,
                  isLangauge: true),
              const SizedBox(height: 40),
              Text("Contact us", style: AppStyle.style16font700black),
              SettingItem(title: "Call us", icon: Assets.icons.contact),
              SettingItem(title: "About us", icon: Assets.icons.exclamation),
              const SizedBox(height: 40),
              SettingItem(title: "Sign out", icon: Assets.icons.signOut),
            ],
          ),
        ),
      ),
    );
  }
}
