import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_app/core/services/shared_prefrences_singleton.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(Locale(Pref.getString(_key) ?? 'ar'));

  static const _key = 'app_language';

  bool get isArabic => state.languageCode == 'ar';

  void changeLanguage(String languageCode) {
    Pref.setString(_key, languageCode);
    emit(Locale(languageCode));
  }
}
