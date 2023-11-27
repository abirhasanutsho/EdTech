import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/constance/utils.dart';
import '../../data/models/user_models.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  File? image;

   selectImage(BuildContext context) async {
    image = await pickImageFromGallery(context);
  }

  Future<void> signUp(UserModel user, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      );
      if (image != null) {
        String imageUrl = await storeFileToFirebase(
            'profile_pics/${_auth.currentUser!.uid}', image!);
        user = user.copyWith(
            profilePicUrl: imageUrl); // Update the UserModel with the image URL
      }
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
      'profilePicUrl': user.profilePicUrl,
    });
  }

  Future storeFileToFirebase(String ref, File profilePic) async {
    UploadTask uploadTask = firebaseStorage.ref().child(ref).putFile(profilePic);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

}
