import 'package:flutter/material.dart';

class SpaceContainer extends StatelessWidget {
  const SpaceContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        height: 6,
        color: const Color(0xffF1EFF9),
      ),
    );
  }
}
