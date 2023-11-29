import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edtech/features/auth/data/service/firestore_services.dart';

class FireStoreRepository extends FireStoreServices {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future addUserDataFireStore(
    Map<String, dynamic> data,
    String collectionName,
    String docName,
  ) async {
    try {
      await firebaseFirestore.collection(collectionName).doc(docName).set(data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future getUserDataFromFireStore(String collectionName, String docName) async {
    try {
      final userData =
          await firebaseFirestore.collection(collectionName).doc(docName).get();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
