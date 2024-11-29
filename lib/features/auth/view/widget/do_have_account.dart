import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_style.dart';

class DoHaveAccount extends StatelessWidget {
  const DoHaveAccount({super.key, required this.title, required this.subtitle});
  final String title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: title,
        style: AppStyle.style14font700black,
        children: [
          TextSpan(
              text: subtitle,
              style: AppStyle.style14font700black
                  .copyWith(color: AppColors.primaryColor)),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
