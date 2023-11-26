import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../data/models/user_models.dart';
import '../../domain/provider/auth_provider.dart'; // Import your UserModel file

class SignUpScreen extends ConsumerWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef  ref) {
    final authController = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
            ),
            TextFormField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            authController.state ? Center(child: CircularProgressIndicator(),) : ElevatedButton(
              onPressed: () {
                // Create a UserModel using the entered data
                final newUser = UserModel(
                  name: _nameController.text,
                  email: _emailController.text,
                  phone: _phoneController.text,
                  address: _addressController.text,
                );

                // Call the signUp function from AuthController
                authController.signUp(newUser, _passwordController.text, context);
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
