import 'package:digifly/core/utils/app_colors.dart';
import 'package:digifly/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../core/utils/app_style.dart';

class EditAccountItem extends StatelessWidget {
  const EditAccountItem(
      {super.key,
      required this.title,
      required this.subtitle,
      this.isEdit = false,
      this.onTap, this.onChanged, this.controller});
  final String title, subtitle;
  final bool isEdit;
  final TextEditingController? controller;
  final Function()? onTap;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppStyle.style14font500black),
        const SizedBox(height: 18),
        Row(
          children: [
            isEdit
                ? Expanded(
                    child: TextFormField(
                      controller:controller,
                      style: AppStyle.style14font700black,
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        
                      ),
                      onChanged: onChanged,
                      
                    ),
                  )
                : Expanded(
                    child: Text(subtitle, style: AppStyle.style14font700black)),
            title == "Email" || isEdit
                ? const SizedBox()
                : GestureDetector(
                    onTap: onTap,
                    child: SvgPicture.asset(
                      Assets.icons.edit,
                      color: AppColors.primaryColor,
                      fit: BoxFit.scaleDown,
                    ),
                  )
          ],
        ),
      ],
    );
  }
}
