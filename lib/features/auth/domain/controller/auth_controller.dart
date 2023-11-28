import 'package:edtech/features/auth/domain/repositories/auth_repositories.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  bool _isLoading = false;
  UserCredential? _userCredential;
  Map<String, dynamic> _userData = {};
  AuthRepository authRepository = AuthRepository();

  bool get isLoader => _isLoading;
  UserCredential? get userCredential => _userCredential;
  Map<String, dynamic> get userData => _userData;

  setLoader(bool loader) {
    _isLoading= loader;
    notifyListeners();
  }

  Future<UserCredential?> loginUserProvider(String email, String password)async {
    setLoader(true);
    try {

      _userCredential = await authRepository.loginWithUserFirebase(email, password);
      setLoader(false);
      return _userCredential;

    } catch (e) {
      setLoader(false);
      return Future.error(e.toString());
    }
  }


  Future<UserCredential?> signUpUserProvider(String email, String password,
      String address, String userName, String phoneNumber)async {
    setLoader(true);
    try {

      _userCredential = await authRepository.signUpWithFirebase(email, password, address, userName, phoneNumber);
      setLoader(false);
      return _userCredential;

    } catch (e) {
      setLoader(false);
      return Future.error(e.toString());
    }
  }

}
