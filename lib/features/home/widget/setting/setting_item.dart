import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_style.dart';
import '../../../../gen/assets.gen.dart';

class SettingItem extends StatelessWidget {
  const SettingItem(
      {super.key,
      required this.title,
      required this.icon,
      this.onTap,
      this.isLangauge});
  final String title, icon;
  final Function()? onTap;
  final bool? isLangauge;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 10, top: 16),
      title: Text(title,
          style: AppStyle.style14font500black
              .copyWith(fontWeight: FontWeight.w600)),
      leading: SvgPicture.asset(icon),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          isLangauge == null
              ? const SizedBox()
              : Text("العربية", style: AppStyle.style14font700black),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.all(1),
            child: GestureDetector(
              onTap: onTap,
              child: SvgPicture.asset(Assets.icons.arrowSimple, height: 18),
            ),
          ),
        ],
      ),
    );
  }
}
