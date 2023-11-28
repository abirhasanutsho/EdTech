import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AppColors {
  static Color whitecolor = const Color(0xFFffffff);
  static Color navbartxtcolor = const Color(0xFF8aa9c7);
  static Color primarycolor = const Color(0xFF0d1d2b);
  static Color backgroundcolor = const Color(0xFFf9f9fa);
  static Color textprimarycolor = const Color(0xFF111827);
  static Color buttoncolor =  Colors.indigo;
  static Color selectioncolor = const Color(0xFF17314a);
  static Color lightgreycolor = const Color(0xFFf7f8f8);
  static Color blackcolor = Colors.black;
}
void showSnackBar({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}
Future<File?> pickImageFromGallery(BuildContext context) async {
  File? image;
  try {
    final pickedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
  } catch (e) {
    showSnackBar(context: context, content: e.toString());
  }
  return image;
}