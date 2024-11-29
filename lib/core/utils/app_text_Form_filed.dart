import 'package:digifly/core/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppTextFormFiled extends StatelessWidget {
  const AppTextFormFiled({super.key, this.hint, this.icon});
  final String? hint, icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: icon == null
            ? null
            : Padding(
                padding: const EdgeInsets.only(right: 22, bottom: 10),
                child: SvgPicture.asset(icon!),
              ),
        hintText: hint,
        hintStyle: AppStyle.style14font500black
            .copyWith(color: const Color(0xff666666)),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue, // لون البوردر عند التركيز
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
