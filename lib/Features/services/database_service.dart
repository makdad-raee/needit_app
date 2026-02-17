abstract class DataBaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });
  Future<dynamic> getData({required String? documentId, required String path});
}
