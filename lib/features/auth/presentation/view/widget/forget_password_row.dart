import 'package:digifly/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_style.dart';

class ForgetPasswordRow extends StatefulWidget {
  const ForgetPasswordRow({super.key});

  @override
  State<ForgetPasswordRow> createState() => _ForgetPasswordRowState();
}

bool isRemendered = false;

class _ForgetPasswordRowState extends State<ForgetPasswordRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 1.3,
          child: Checkbox(
            value: isRemendered,
            activeColor: Colors.grey,
            checkColor: Colors.white,
            onChanged: (value) {
              isRemendered = value!;
              setState(() {});
            },
          ),
        ),
        const SizedBox(width: 8),
        Text(S.of(context).remember_me, style: AppStyle.style14font500black),
        const Spacer(),
        Text(S.of(context).forgot_password,
            style: AppStyle.style14font500black
                .copyWith(color: AppColors.primaryColor)),
      ],
    );
  }
}
