import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseServices {
  Future<UserCredential> loginWithUserFirebase(String email, String password);
  Future<UserCredential> signUpWithFirebase(String email, String password,
      String address, String userName, String phoneNumber);
  void signOutUser();
  bool isLoggedUser();


}
