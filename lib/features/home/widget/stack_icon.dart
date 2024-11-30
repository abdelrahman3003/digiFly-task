import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';

class StackIcon extends StatelessWidget {
  const StackIcon(
      {super.key, required this.icon, required this.count, this.onPressed});
  final IconData icon;
  final int count;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 24,
      backgroundColor: const Color(0xffF5FBF9),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          IconButton(
            icon: Icon(icon, color: AppColors.primaryColor, size: 28.sp),
            onPressed: onPressed,
          ),
          if (count > 0)
            Positioned(
              right: 4,
              top: 8,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 9,
                  backgroundColor: Colors.red,
                  child: Text(
                    count.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
