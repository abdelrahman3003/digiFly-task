import 'package:digifly/core/utils/app_style.dart';
import 'package:digifly/features/auth/presentation/controller/local/local_cubit.dart';
import 'package:digifly/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeLanguageView extends StatelessWidget {
  const ChangeLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).change_language,
          style: AppStyle.style16font700black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).select_language,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            DropdownButton<AppLanguage>(
              value: context.watch<LocalCubit>().state,
              onChanged: (AppLanguage? newLanguage) {
                if (newLanguage != null) {
                  context.read<LocalCubit>().changeLanguage(newLanguage);
                }
              },
              items: [
                DropdownMenuItem(
                  value: AppLanguage.en,
                  child: Text(S.of(context).english),
                ),
                DropdownMenuItem(
                  value: AppLanguage.ar,
                  child: Text(S.of(context).arabic),
                ),
              ],
              isExpanded: true,
            ),
          ],
        ),
      ),
    );
  }
}
