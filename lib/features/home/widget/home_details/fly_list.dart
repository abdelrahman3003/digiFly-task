import 'package:flutter/material.dart';

class FlyList extends StatelessWidget {
  const FlyList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Container(
        width: 350,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: const DecorationImage(
            image: AssetImage('assets/images/fly.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
