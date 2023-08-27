import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_iot_security_cam/src/data/auth/mapper/user_account_mapper.dart';
import 'package:flutter_iot_security_cam/src/domain/auth/model/user_account.dart';
import 'package:flutter_iot_security_cam/src/domain/auth/repository/auth_repository.dart';

class FirebaseAuthRepositoryImpl extends AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<UserAccount?> login(String email, String password) async {
    final data = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return data.toUserAccount();
  }

  @override
  Future<bool> logout() async {
    throw UnimplementedError();
    return false;
  }

  @override
  Future<UserAccount?> getCurrentUserAccount() async {
    return FirebaseAuth.instance.currentUser?.toUserAccount();
  }
}
