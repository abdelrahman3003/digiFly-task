import 'package:flutter/material.dart';

import '../../../../../../gen/assets.gen.dart';

class UserListTile extends StatelessWidget {
  const UserListTile(
      {super.key,
      required this.firstNmae,
      required this.subtitle,
      required this.lastNmae});
  final String firstNmae, lastNmae, subtitle;
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
      title: Row(
        children: [
          Text(
            firstNmae,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 6),
          Text(
            lastNmae,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 14, color: Colors.grey),
      ),
    );
  }
}
