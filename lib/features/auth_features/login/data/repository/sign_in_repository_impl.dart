import 'package:whatsapp_clone/core/base/auth_base.dart';
import 'package:whatsapp_clone/features/auth_features/login/domain/repository/sign_in_repository.dart';

class SignInRepositoryImpl implements SignInRepository {
  final AuthBase authService;

  SignInRepositoryImpl(this.authService);

  @override
  Future<void> signIn(String email, String password) {
    return authService.signIn(email, password);
  }
}
