import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../data/models/user_models.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signUp(UserModel user, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      );

      await _saveUserInfoToFirestore(user);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _saveUserInfoToFirestore(UserModel user) async {
    final userCollection = _firestore.collection('users');
    final userDoc = userCollection.doc(_auth.currentUser!.uid);

    await userDoc.set({
      'name': user.name,
      'email': user.email,
      'phone': user.phone,
      'address': user.address,
    });
  }
}
