import 'package:flutter/material.dart';

import '../../../../../../gen/assets.gen.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 28,
        backgroundColor: Colors.grey.shade200,
        child: CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(
              Assets.images.proflePic.path,
            )),
      ),
      title: const Text(
        "Ahmed Alaa",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: const Text(
        "ahmed.alaa123@gmail.com",
        style: TextStyle(fontSize: 14, color: Colors.grey),
      ),
    );
  }
}
