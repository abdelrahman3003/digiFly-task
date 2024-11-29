import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_style.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, this.color, required this.title, this.onPressed});
  final Color? color;
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      onPressed: onPressed,
      child: Text(title, style: AppStyle.style16font700wite),
    );
  }
}
