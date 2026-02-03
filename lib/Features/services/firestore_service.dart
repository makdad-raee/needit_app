import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:needit_app/Features/services/database_service.dart';

class FirestorService implements DataBaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    required String documentId,
  }) async {
    await firestore.collection(path).doc(documentId).set(data);
  }

  @override
  Future<Map<String, dynamic>?> getData({
    required String documentId,
    required String path,
  }) async {
    final doc = await firestore.collection(path).doc(documentId).get();
    if (doc.exists) {
      final data = doc.data()!;
      return data;
    }
    return null;
  }
}
