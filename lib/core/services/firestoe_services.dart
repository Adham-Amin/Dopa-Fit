import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dopa_fit/core/services/database_service.dart';

class FirestoeServices implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    required String docId,
  }) async {
    await firestore.collection(path).doc(docId).set(data);
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? docId,
  }) async {
    final result = await firestore.collection(path).doc(docId).get();
    return result.data();
  }

  @override
  Future<bool> checkData({required String path, required String docId}) async {
    var data = await firestore.collection(path).doc(docId).get();
    return data.exists;
  }
}
