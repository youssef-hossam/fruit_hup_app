import 'package:fruit_hub_app/features/auth/domain/entities/user_entity.dart';

abstract class DatabaseService {
  // generic methods for database operations
  // such as add, get, update, delete
  Future<void> addData({
    String? documentId,
    required String path,
    required Map<String, dynamic> data,
  });
  Future getData({required String path, required String documentId});
  Future<bool> checkIfDataExists({
    required String path,
    required String documentId,
  });

  saveUserDaata({
    required UserEntity userEntity,
  });
}
