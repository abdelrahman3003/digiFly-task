import 'dart:ui';

import 'package:bloc/bloc.dart';

enum AppLanguage { en, ar }

Locale deviceLocale = window.locale;

class LocalCubit extends Cubit<AppLanguage> {
  LocalCubit(AppLanguage initialLanguage) : super(AppLanguage.en);
  void changeLanguage(AppLanguage language) {
    emit(language);
  }
}
