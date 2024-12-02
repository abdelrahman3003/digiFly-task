import 'package:digifly/core/utils/app_text_Form_filed.dart';
import 'package:digifly/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_style.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, required this.hintText, this.controller});
  final String hintText;
  final TextEditingController? controller;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

bool isVisibile = true;

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: isVisibile,
      validator: (value) {
        return validator(value);
      },
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: isEnglish(context)
              ? const EdgeInsets.only(right: 22, bottom: 10)
              : const EdgeInsets.only(left: 22, bottom: 10),
          child: SvgPicture.asset(
            Assets.icons.lockSolid1,
            fit: BoxFit.scaleDown,
          ),
        ),
        suffixIcon: IconButton(
            onPressed: () {
              isVisibile = !isVisibile;
              setState(() {});
            },
            icon: Icon(isVisibile ? Icons.visibility : Icons.visibility_off,
                color: const Color(0xffCCCCCC))),
        hintText: widget.hintText,
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
