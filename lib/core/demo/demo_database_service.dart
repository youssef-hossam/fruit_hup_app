import 'package:fruit_hub_app/core/demo/demo_data.dart';
import 'package:fruit_hub_app/core/services/database_service.dart';
import 'package:fruit_hub_app/features/auth/domain/models/user_model.dart';

/// In-memory replacement for Firestore, used only in demo mode.
class DemoDatabaseService implements DatabaseService {
  final Map<String, Map<String, Map<String, dynamic>>> _db = {
    'products': {for (final p in demoProducts) p['id'] as String: p},
    'orders': {
      for (final o in demoOrdersFor(demoUser.uid)) o['id'] as String: o
    },
    'users': {demoUser.uid: demoUser.toJson()},
  };

  static final UserModel demoUser = UserModel(
    uid: 'demo-user',
    name: 'يوسف حدوة',
    email: 'youssef@fruithub.app',
  );

  @override
  Future<void> addData({
    String? documentId,
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final id = documentId ?? DateTime.now().microsecondsSinceEpoch.toString();
    (_db[path] ??= {})[id] = {...data, 'id': data['id'] ?? id};
  }

  @override
  Future getData({required String path, required String documentId}) async {
    final data = _db[path]?[documentId];
    if (data == null) throw Exception('Not found');
    return UserModel.fromJson(data);
  }

  @override
  Future<bool> checkIfDataExists(
      {required String path, required String documentId}) async {
    return _db[path]?.containsKey(documentId) ?? false;
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
    await Future.delayed(const Duration(milliseconds: 400));
    var docs = (_db[path]?.values.toList() ?? [])
        .map((e) => Map<String, dynamic>.from(e))
        .toList();
    if (whereField != null) {
      docs = docs.where((d) => d[whereField] == isEqualTo).toList();
    }
    if (orderBy != null) {
      docs.sort((a, b) {
        final r = Comparable.compare(
            a[orderBy] as Comparable, b[orderBy] as Comparable);
        return descending ? -r : r;
      });
    }
    if (limit != null && docs.length > limit) docs = docs.sublist(0, limit);
    return docs;
  }

  @override
  Future<bool> isCollectionEmpty({required String path}) async =>
      _db[path]?.isEmpty ?? true;
}
