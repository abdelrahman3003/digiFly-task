import 'package:digifly/core/utils/app_button.dart';
import 'package:digifly/core/utils/app_style.dart';
import 'package:digifly/core/utils/navigate.dart';
import 'package:digifly/features/home/presentation/view/widget/setting/edit_account/edit_account_item.dart';
import 'package:digifly/features/home/presentation/view/widget/setting/space_container.dart';
import 'package:digifly/gen/assets.gen.dart';
import 'package:digifly/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditAcountView extends StatefulWidget {
  const EditAcountView({super.key});

  @override
  State<EditAcountView> createState() => _EditAcountViewState();
}

bool isEditeFirstName = false;
bool isEditeLastName = false;

class _EditAcountViewState extends State<EditAcountView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).edit_account,
            style: AppStyle.style16font700black,
          ),
          leading: Padding(
            padding: const EdgeInsets.all(1),
            child: GestureDetector(
              onTap: () {
                context.pop();
              },
              child: SvgPicture.asset(
                Assets.icons.backArrow,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SpaceContainer(),
                const SizedBox(height: 40),
                EditAccountItem(
                    title: S.of(context).email,
                    subtitle: "ahmed.alaa123@gmail.com"),
                const SizedBox(height: 40),
                EditAccountItem(
                  title: S.of(context).first_name,
                  subtitle: "Ahmed",
                  isEdit: isEditeFirstName,
                  onTap: () {
                    isEditeFirstName = true;
                    setState(() {});
                  },
                ),
                const SizedBox(height: 40),
                EditAccountItem(
                  title: S.of(context).last_name,
                  subtitle: "Alaa",
                  isEdit: isEditeLastName,
                  onTap: () {
                    isEditeLastName = true;
                    setState(() {});
                  },
                ),
                const SizedBox(height: 25),
                const SizedBox(
                    width: double.infinity, child: AppButton(title: "Save"))
              ],
            ),
          ),
        ));
  }
}
