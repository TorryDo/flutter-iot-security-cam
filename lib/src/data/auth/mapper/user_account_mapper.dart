import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_iot_security_cam/src/domain/auth/model/user_account.dart';

extension UserAccountX on User {
  UserAccount toUserAccount() {
    return UserAccount(uid: uid, name: displayName, email: email);
  }
}

extension UserCredentialX on UserCredential {
  UserAccount? toUserAccount() {
    try {
      return UserAccount(
          uid: user!.uid, name: user!.displayName, email: user!.email);
    } on Exception {
      return null;
    }
  }
}
