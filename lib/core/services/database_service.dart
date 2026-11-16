abstract class DatabaseService {
  // Generic database operations, so the app does not depend on Firestore
  // directly (Firestore in production, an in-memory store in demo mode).
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

  /// Returns every document of a collection as a map (the document id is
  /// added under the `id` key).
  Future<List<Map<String, dynamic>>> getCollection({
    required String path,
    String? whereField,
    Object? isEqualTo,
    String? orderBy,
    bool descending = false,
    int? limit,
  });

  Future<bool> isCollectionEmpty({required String path});
}
