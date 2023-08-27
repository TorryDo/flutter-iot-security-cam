import 'package:flutter/material.dart';
import 'package:flutter_iot_security_cam/src/domain/auth/model/user_account.dart';
import 'package:flutter_iot_security_cam/src/domain/auth/repository/auth_repository.dart';

class LoginProvider extends ChangeNotifier {
  final emailController = TextEditingController(text: "neemon.teen@gmail.com");
  final passwordController = TextEditingController(text: '123456789');

  final AuthRepository authRepository;

  LoginProvider({required this.authRepository});

  Future<UserAccount?> login() async {
    final email = emailController.text;
    final password = passwordController.text;
    return authRepository.login(email, password);
  }
}
