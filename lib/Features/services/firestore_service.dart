import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:needit_app/Features/services/database_service.dart';

class FirestorService implements DataBaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData({String? documentId, required String path}) async {
    if (documentId != null) {
      final doc = await firestore.collection(path).doc(documentId).get();
      if (doc.exists) {
        final data = doc.data()!;
        return data;
      }
    } else {
      final querySnapshot = await firestore.collection(path).get();
      final dataList = querySnapshot.docs.map((doc) => doc.data()).toList();
      return dataList;
    }
  }
}
