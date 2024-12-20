import 'package:digifly/features/home/presentation/view/widget/home_details/best_seller_text.dart';
import 'package:digifly/features/home/presentation/view/widget/home_details/fly_list.dart';
import 'package:digifly/features/home/presentation/view/widget/home_details/profile_list_tile.dart';
import 'package:digifly/features/home/presentation/view/widget/home_details/search_bar_home.dart';
import 'package:digifly/features/home/presentation/view/widget/home_details/seller_item.dart';
import 'package:flutter/material.dart';

class HomeDetailsView extends StatelessWidget {
  const HomeDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(children: [
              const ProfileListTile(),
              const SearchBarHome(),
              const SizedBox(height: 24),
              const SizedBox(height: 230, child: FlyList()),
              const SizedBox(height: 40),
              const BestSellerText(),
              const SizedBox(height: 24),
              SizedBox(
                height: 280,
                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => const SellerItem(),
                ),
              ),
            ]),
          )),
    );
  }
}
