import 'package:digifly/core/utils/app_colors.dart';
import 'package:digifly/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../generated/l10n.dart';

class SearchBarHome extends StatelessWidget {
  const SearchBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: const BoxDecoration(
                color: Color(0xffF2F2F2),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    bottomLeft: Radius.circular(4))),
            child: TextField(
              decoration: InputDecoration(
                hintText: S.of(context).search_here,
                hintStyle: const TextStyle(color: Color(0xff999999)),
                border: InputBorder.none,
                prefixIcon: const Icon(Icons.search,
                    size: 30, color: Color(0xff999999)),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(4),
                  bottomRight: Radius.circular(4))),
          child: SvgPicture.asset(
            Assets.icons.flter,
          ),
        ),
      ],
    );
  }
}
