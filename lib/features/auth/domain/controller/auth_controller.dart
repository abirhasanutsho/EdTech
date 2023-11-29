import 'package:edtech/features/auth/data/models/user_models.dart';
import 'package:edtech/features/auth/data/service/firestore_services.dart';
import 'package:edtech/features/auth/domain/repositories/auth_repositories.dart';
import 'package:edtech/features/auth/domain/repositories/firestore_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  bool _isLoading = false;
  UserCredential? _userCredential;
  Map<String, dynamic> _userData = {};
  AuthRepository authRepository = AuthRepository();
  FireStoreRepository fireStoreRepository = FireStoreRepository();

  bool get isLoader => _isLoading;
  UserCredential? get userCredential => _userCredential;
  Map<String, dynamic> get userData => _userData;

  setLoader(bool loader) {
    _isLoading = loader;
    notifyListeners();
  }

  Future<UserCredential?> loginUserProvider(
      String email, String password) async {
    setLoader(true);
    try {
      _userCredential =
          await authRepository.loginWithUserFirebase(email, password);
      setLoader(false);
      return _userCredential;
    } catch (e) {
      setLoader(false);
      return Future.error(e.toString());
    }
  }

  Future<UserCredential?> signUpUserProvider(
      UserModel userModel, String password) async {
    setLoader(true);
    try {
      _userCredential =
          await authRepository.signUpWithFirebase(userModel, password);
      final data = {
        "email": userModel.email,
        "address": userModel.address,
        "userName": userModel.name,
        "phoneNumber": userModel.phone,
      };
      bool isSuccess =
          await addToUserDatabase(data, "users", _userCredential!.user!.uid);
      if (isSuccess) {
        return _userCredential;
      } else {
        throw Exception("Error Something Went Wrong");
      }
      setLoader(false);
      return _userCredential;
    } catch (e) {
      setLoader(false);
      return Future.error(e.toString());
    }
  }

  Future<bool> addToUserDatabase(
      Map<String, dynamic> data, String collectionName, String docName) async {
    var value = false;
    try {
      await fireStoreRepository.addUserDataFireStore(
          data, collectionName, docName);
      value = true;
    } catch (e) {
      value = false;
    }
    return value;
  }
}
