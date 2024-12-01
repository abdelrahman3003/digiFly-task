import 'package:digifly/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: 120,
      height: 80,
      child: Image.asset(Assets.images.logo.path, fit: BoxFit.contain),
    ));
  }
}
