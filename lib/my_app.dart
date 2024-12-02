import 'dart:ui';

import 'package:digifly/core/utils/app_colors.dart';
import 'package:digifly/core/utils/app_routes.dart';
import 'package:digifly/features/auth/presentation/controller/local/local_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'generated/l10n.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 116),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          Locale deviceLocale = window.locale;
          AppLanguage initialLanguage = deviceLocale.languageCode == 'ar'
              ? AppLanguage.ar
              : AppLanguage.en;
          return BlocProvider(
            create: (context) => LocalCubit(initialLanguage),
            child: BlocBuilder<LocalCubit, AppLanguage>(
              builder: (context, languageState) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  locale: languageState == AppLanguage.en
                      ? const Locale('en', '')
                      : const Locale('ar', ''),
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  theme: ThemeData(
                    fontFamily: 'Cairo',
                    elevatedButtonTheme: ElevatedButtonThemeData(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  onGenerateRoute: AppRoutes.generateRoute,
                );
              },
            ),
          );
        });
  }
}
