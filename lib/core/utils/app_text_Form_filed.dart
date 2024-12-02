import 'package:digifly/core/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppTextFormFiled extends StatelessWidget {
  const AppTextFormFiled({super.key, this.hint, this.icon, this.controller});
  final String? hint, icon;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        return validator(value);
      },
      decoration: InputDecoration(
        prefixIcon: icon == null
            ? null
            : Padding(
                padding: isEnglish(context)
                    ? const EdgeInsets.only(right: 22, bottom: 10)
                    : const EdgeInsets.only(left: 22, bottom: 10),
                child: SvgPicture.asset(
                  icon!,
                  fit: BoxFit.scaleDown,
                ),
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

bool isEnglish(BuildContext context) {
  return Localizations.localeOf(context).languageCode == "en";
}

String? validator(String? value) {
  if (value == null) {
    return "This field is required";
  } else if (value.length < 6) {
    return "This field must be more than 6 characters";
  }
  return null;
}
