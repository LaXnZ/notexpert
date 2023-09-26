import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:notexpert/src/repository/authentication_repository/authentication_repository.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();

  void loginUser(String email, String password) {
    AuthenticationRepository.instance
        .signInWithEmailAndPassword(email, password);
  }
}
