import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hub_app/core/services/database_service.dart';
import 'package:fruit_hub_app/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub_app/features/auth/domain/models/user_model.dart';

class FirestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
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
  Future<List<Map<String, dynamic>>> getCollection({
    required String path,
    String? whereField,
    Object? isEqualTo,
    String? orderBy,
    bool descending = false,
    int? limit,
  }) async {
    Query<Map<String, dynamic>> query = firestore.collection(path);
    if (whereField != null) {
      query = query.where(whereField, isEqualTo: isEqualTo);
    }
    if (orderBy != null && whereField == null) {
      // Ordering together with a `where` on another field needs a composite
      // index, so in that case we sort on the client instead.
      query = query.orderBy(orderBy, descending: descending);
    }
    if (limit != null) query = query.limit(limit);

    final snapshot = await query.get();
    final docs = snapshot.docs
        .map((doc) => {...doc.data(), 'id': doc.data()['id'] ?? doc.id})
        .toList();

    if (orderBy != null && whereField != null) {
      docs.sort((a, b) {
        final result = Comparable.compare(
            a[orderBy] as Comparable, b[orderBy] as Comparable);
        return descending ? -result : result;
      });
    }
    return docs;
  }

  @override
  Future<bool> isCollectionEmpty({required String path}) async {
    final snapshot = await firestore.collection(path).limit(1).get();
    return snapshot.docs.isEmpty;
  }
}
