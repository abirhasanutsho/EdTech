import 'package:edtech/features/auth/data/models/user_models.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseServices {
  Future<UserCredential> loginWithUserFirebase(String email, String password);
  Future<UserCredential> signUpWithFirebase(
      UserModel userModel, String password);
  void signOutUser();
  bool isLoggedUser();
}
