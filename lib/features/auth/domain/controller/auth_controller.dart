import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edtech/features/dashboard/presentation/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../data/models/user_models.dart';
import '../repositories/repositories.dart';

class AuthController extends ChangeNotifier {
  final AuthRepository _authRepository;

  AuthController(this._authRepository);


  bool _isLoader = false;
  bool get isLoader => _isLoader;



  Future<void> signUp(
      UserModel user, String password, BuildContext context) async {
    try {
      _isLoader = true; // Set loading state

      await _authRepository.signUp(user, password);

      Fluttertoast.showToast(
          msg: "SignUp Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      notifyListeners();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const DashBoardPage()));
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
      _isLoader = false; // Reset loading state
      notifyListeners();
    }
  }
}
