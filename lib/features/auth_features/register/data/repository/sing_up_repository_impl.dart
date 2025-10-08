import 'package:whatsapp_clone/features/auth_features/register/domain/repository/sing_up_repository.dart';
import 'package:whatsapp_clone/core/base/auth_base.dart';

class SingUpRepositoryImpl implements SingUpRepository {
  final AuthBase authService;

  SingUpRepositoryImpl(this.authService);

  @override
  Future<void> signUp(String email, String password) async {
    return authService.signUp(email, password);
  }
}
