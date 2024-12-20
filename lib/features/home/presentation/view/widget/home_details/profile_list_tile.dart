import 'package:digifly/features/home/presentation/controller/home/home_cubit.dart';
import 'package:digifly/features/home/presentation/view/widget/home_details/stack_icon.dart';
import 'package:digifly/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<HomeCubit>(context);
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
            cubit.initialFirstName,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8),
          Text(
            cubit.initialLastName,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
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
