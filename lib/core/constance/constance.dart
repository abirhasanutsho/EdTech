import 'package:firebase_auth/firebase_auth.dart';

User? user = FirebaseAuth.instance.currentUser;
const String SIGNIN = "Login";
const String SIGNUP = "Register";
const String ALREADYHAVEANACCOUNT = "Already have an account?";