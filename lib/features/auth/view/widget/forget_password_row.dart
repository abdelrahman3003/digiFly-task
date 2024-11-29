import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_style.dart';

class ForgetPasswordRow extends StatelessWidget {
  const ForgetPasswordRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: AppColors.grey))),
        const SizedBox(width: 24),
        Text("Remember me", style: AppStyle.style14font500black),
        const Spacer(),
        Text("Forgot Password ?",
            style: AppStyle.style14font500black
                .copyWith(color: AppColors.primaryColor)),
      ],
    );
  }
}
