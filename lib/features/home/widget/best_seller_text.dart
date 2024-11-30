import 'package:digifly/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_style.dart';

class BestSellerText extends StatelessWidget {
  const BestSellerText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Best seller",
          style: AppStyle.style18font600black,
        ),
        const Spacer(),
        Text(
          "View all",
          style: AppStyle.style14font700black
              .copyWith(color: AppColors.primaryColor),
        ),
        const SizedBox(width: 5),
        SvgPicture.asset(Assets.icons.arrowSimple)
      ],
    );
  }
}
