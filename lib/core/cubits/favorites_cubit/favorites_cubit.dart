import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_app/core/services/shared_prefrences_singleton.dart';

/// Favorite product ids, saved on the device.
class FavoritesCubit extends Cubit<Set<String>> {
  FavoritesCubit() : super(<String>{}) {
    final saved = Pref.getString(_key);
    if (saved != null) {
      emit((jsonDecode(saved) as List).cast<String>().toSet());
    }
  }

  static const _key = 'favorite_products';

  bool isFavorite(String id) => state.contains(id);

  void toggle(String id) {
    final updated = {...state};
    if (!updated.remove(id)) updated.add(id);
    emit(updated);
    Pref.setString(_key, jsonEncode(updated.toList()));
  }
}
