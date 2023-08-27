import 'package:flutter_iot_security_cam/di/locator.dart';
import 'package:flutter_iot_security_cam/src/data/auth/repository/firebase_auth_repository_impl.dart';
import 'package:flutter_iot_security_cam/src/domain/auth/repository/auth_repository.dart';

void domainModule(){

  locator.registerSingleton<AuthRepository>(FirebaseAuthRepositoryImpl());

}