import 'package:edtech/core/constance/constance.dart';
import 'package:edtech/features/auth/domain/provider/auth_provider.dart';
import 'package:edtech/features/dashboard/presentation/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constance/utils.dart';
import '../../data/components/auth_component.dart';
import '../../data/models/user_models.dart';

class RegisterScreen extends ConsumerWidget {
  final TextEditingController userName = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController phonenumbercontroller = TextEditingController();
  final TextEditingController adddressController = TextEditingController();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.watch(authProvider);
    return Scaffold(
      backgroundColor: AppColors.whitecolor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 102,
                  ),
                  Text(
                    'Hey there',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: AppColors.blackcolor,
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  customTextField(
                    controller: userName,
                    hintText: 'User Name',
                    iconName: Icons.person_outline,
                  ),
                  customTextField(
                    controller: emailcontroller,
                    hintText: 'Email',
                    iconName: Icons.message_outlined,
                  ),
                  customTextField(
                    controller: phonenumbercontroller,
                    hintText: 'Phone',
                    iconName: Icons.phone,
                  ),
                  customTextField(
                    controller: adddressController,
                    hintText: 'Address',
                    iconName: Icons.work_outline,
                  ),
                  PasswordTextField(
                    hintText: 'Password',
                    iconName: Icons.lock_outline,
                    controller: passwordcontroller,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  authController.isLoader
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.buttoncolor,
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            final newUser = UserModel(
                              name: userName.text,
                              email: emailcontroller.text,
                              phone: phonenumbercontroller.text,
                              address: adddressController.text,
                            );

                            // Call the signUp function from AuthController
                            authController.signUpUserProvider(
                              newUser,
                              passwordcontroller.text,
                            ).then((value) {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const DashBoardPage()));
                            });

                          },
                          child: Container(
                            width: 315,
                            height: 54,
                            decoration: BoxDecoration(
                              color: AppColors.buttoncolor,
                              borderRadius: BorderRadius.circular(99),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x4c95adfe),
                                  offset: Offset(0, 10),
                                  blurRadius: 30,
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Text(
                                '$SIGNUP',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: const Center(
                          child: Text(
                            '$ALREADYHAVEANACCOUNT ',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Center(
                          child: Text(
                            '$SIGNIN',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
