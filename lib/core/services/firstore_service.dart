import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hub_app/core/services/database_service.dart';
import 'package:fruit_hub_app/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub_app/features/auth/domain/models/user_model.dart';

class FirestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId}) async {
    await firestore.collection(path).doc(documentId).set(data);
  }

  @override
  Future<UserEntity> getData(
      {required String path, required String documentId}) async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await firestore.collection(path).doc(documentId).get();
    if (!documentSnapshot.exists) {
      throw Exception("User data not found");
    }
    return UserModel.fromJson(documentSnapshot.data()!);
  }

  @override
  Future<bool> checkIfDataExists(
      {required String path, required String documentId}) {
    return firestore.collection(path).doc(documentId).get().then((doc) {
      return doc.exists;
    });
  }

  @override
  Future<void> saveUserDaata({required UserEntity userEntity}) async {
    await addData(
        path: 'users', documentId: userEntity.uid, data: userEntity.toMap());
  }
}
