import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../gen/assets.gen.dart';

class ContinueWithGoogle extends StatelessWidget {
  const ContinueWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: const Color(0xffCCCCCC)),
            borderRadius: BorderRadius.circular(5)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            SvgPicture.asset(Assets.icons.google),
            Expanded(
              child: Center(
                child: Text(
                  "Contiue with Google",
                  style: AppStyle.style14font700black,
                ),
              ),
            )
          ],
        ));
  }
}
