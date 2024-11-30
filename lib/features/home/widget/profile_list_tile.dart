import 'package:digifly/features/home/widget/stack_icon.dart';
import 'package:digifly/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
  });

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
        "Welcome",
        style: TextStyle(fontSize: 14, color: Colors.grey),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          StackIcon(
            icon: Icons.favorite,
            count: 3,
            onPressed: () {},
          ),
          StackIcon(
            icon: Icons.notifications,
            count: 3,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
