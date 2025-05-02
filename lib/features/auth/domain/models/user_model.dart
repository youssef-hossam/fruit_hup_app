import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub_app/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.email,
    required super.name,
    required super.id,
  });
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      id: user.uid,
      name: user.displayName ?? 'No Name',
      email: user.email ?? 'No Email',
    );
  }
}
