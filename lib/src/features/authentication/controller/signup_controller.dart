import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notexpert/src/repository/authentication_repository/authentication_repository.dart';
import 'package:notexpert/src/repository/user_repository/user_repository.dart';

import '../models/user.dart';
import '../screens/homepage_screen/home_screen.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  final userRepo = Get.put(UserRepository());

  get isPasswordVisible => null;

  void registerUser(String email, String password) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
  }

  Future<void> createUser(User user) async {
    // Check if the user already exists in the database
    final userData = userRepo.getUser(user.email);
    userRepo.createUser(user);
    if (userData == false) {
      // User doesn't exist, so create a new user
      registerUser(user.email, user.password);

      // Navigate to the home screen
      await Get.offAll(() => const HomePage());
    }
  }

  void togglePasswordVisibility() {}
}
