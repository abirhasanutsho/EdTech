import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../data/models/user_models.dart';
import '../repositories/repositories.dart';

class AuthController extends StateNotifier<bool> {
  final AuthRepository _authRepository;

  AuthController(this._authRepository) : super(false);

  Future<void> signUp(
      UserModel user, String password, BuildContext context) async {
    try {
      state = true; // Set loading state

      await _authRepository.signUp(user, password);

      Fluttertoast.showToast(
          msg: "SignUp Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } catch (e) {
      String errorMessage = e.toString();
      if (e is FirebaseException) {
        errorMessage = e.message ?? 'An error occurred during SignUp';
      }

      // Show error message
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } finally {
      state = false; // Reset loading state
    }
  }
}
