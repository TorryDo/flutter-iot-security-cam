import 'package:flutter_iot_security_cam/src/domain/auth/model/user_account.dart';

abstract class AuthRepository{

  Future<UserAccount?> getCurrentUserAccount();

  Future<UserAccount?> login(String email, String password);

  Future<bool> logout();

}