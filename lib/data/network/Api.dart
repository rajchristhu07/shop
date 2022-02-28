import 'package:cloud_firestore/cloud_firestore.dart';

class Api {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  String? path;

  Future<QuerySnapshot> getDataCollection() {
    return _db.collection(path!).get();
  }

  Stream<QuerySnapshot> streamDataCollection() {
    return _db.collection(path!).snapshots();
  }

  Future<DocumentSnapshot> getDocumentById(String id) {
    return _db.collection(path!).doc(id).get();
  }

  Future<void> removeDocument(String id) {
    return _db.collection(path!).doc(id).delete();
  }

  Future<DocumentReference> addDocument(dynamic data) {
    return _db.collection(path!).add(data);
  }

  Future<void> updateDocument(dynamic data, String id) {
    return _db.collection(path!).doc(id).update(data);
  }
}
