import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub_app/core/services/shared_prefrences_singleton.dart';
import 'package:fruit_hub_app/core/utils/backend_endpoints.dart';
import 'package:fruit_hub_app/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub_app/features/auth/domain/models/user_model.dart';

UserEntity getSavedUserData() {
  String userData = Pref.getString(BackEndEndpoints.savedUserData)!;
  return UserModel.fromJson(jsonDecode(userData));
}
