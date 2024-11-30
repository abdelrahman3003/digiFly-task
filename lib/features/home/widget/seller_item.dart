import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_style.dart';
import '../../../gen/assets.gen.dart';

class SellerItem extends StatelessWidget {
  const SellerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 280,
          width: 300,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                    color: const Color(0xffF7F7FB),
                    image: DecorationImage(
                        image: AssetImage(Assets.images.box.path),
                        fit: BoxFit.none,
                        scale: 3)),
              ),
              const SizedBox(height: 10),
              Text(
                "Deafult box, number 1 ",
                style: AppStyle.style14font500black,
              ),
              Row(
                children: [
                  Text(
                    "Category 1",
                    style: AppStyle.style12font600grey,
                  ),
                  const Spacer(),
                  Text(
                    "1500 L.E",
                    style: AppStyle.style16font700wite
                        .copyWith(color: AppColors.primaryColor),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: 18,
          left: 15,
          child: Container(
            height: 25,
            width: 45,
            decoration: const BoxDecoration(
              color: Color(0xffC50030),
            ),
            child: Center(
              child: FittedBox(
                child: Text(
                  "-17%",
                  style:
                      AppStyle.style12font600grey.copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        Positioned(
            top: 18,
            right: 25,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_outline_outlined,
                  size: 32,
                  color: AppColors.primaryColor,
                )))
      ],
    );
  }
}
