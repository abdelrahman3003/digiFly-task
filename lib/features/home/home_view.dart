import 'package:digifly/core/utils/app_colors.dart';
import 'package:digifly/features/home/widget/home_details/home_details_view.dart';
import 'package:digifly/features/home/widget/text_editor/text_editor_view.dart';
import 'package:digifly/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  final PageController pageController = PageController();

  final List<Widget> pages = [
    const HomeDetailsView(),
    const TextEditorView(),
    const Center(child: Text("Setting Page", style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          children: pages,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            pageController.jumpToPage(index);
          });
        },
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          buildNavBarItem(
            icon: Assets.icons.home,
            label: "Home",
            isSelected: currentIndex == 0,
          ),
          buildNavBarItem(
            icon: Assets.icons.textEditor,
            label: "Text Editor",
            isSelected: currentIndex == 1,
          ),
          buildNavBarItem(
            icon: Assets.icons.setting,
            label: "Setting",
            isSelected: currentIndex == 2,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem buildNavBarItem({
    required String icon,
    required String label,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(
          isSelected ? AppColors.primaryColor : Colors.grey,
          BlendMode.srcIn,
        ),
      ),
      label: label,
    );
  }
}