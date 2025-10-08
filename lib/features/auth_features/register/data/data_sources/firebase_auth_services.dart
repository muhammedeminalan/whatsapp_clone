// ignore_for_file: unnecessary_overrides

import 'package:whatsapp_clone/core/service/auth/auth_services.dart';

class FirebaseAuthServices extends AuthService {
  @override
  Future<void> signIn(String email, String password) {
    return super.signIn(email, password);
  }
}
