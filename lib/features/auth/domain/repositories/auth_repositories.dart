import 'package:firebase_auth/firebase_auth.dart';

import '../../data/models/user_models.dart';
import '../../data/service/firebase_services.dart';

class AuthRepository extends FirebaseServices {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  bool isLoggedUser() {
    return auth.currentUser != null;
  }

  @override
  Future<UserCredential> loginWithUserFirebase(
      String email, String password) async {
    return await auth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  void signOutUser() {
    auth.signOut();
  }

  @override
  Future<UserCredential> signUpWithFirebase(
      UserModel userModel, String password) async {
    final userSignUp = await auth.createUserWithEmailAndPassword(
        email: userModel.email, password: password);
    return userSignUp;
  }



}
