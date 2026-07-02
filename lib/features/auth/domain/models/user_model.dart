import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub_app/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.email,
    required super.name,
    required super.uid,
  });
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      uid: user.uid,
      name: user.displayName ?? "No Name",
      email: user.email ?? 'No Email',
    );
  }
  // factory UserModel.fromJson(Map<String, dynamic> json) {
  //   return UserModel(
  //     uid: json['id'] ?? '',
  //     name: json['name'] ?? 'No Name',
  //     email: json['email'] ?? 'No Email',
  //   );
  // }

  Map<String, dynamic> toJson() {
    return {
      'id': uid,
      'name': name,
      'email': email,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      uid: entity.uid,
      name: entity.name,
      email: entity.email,
    );
  }
}
