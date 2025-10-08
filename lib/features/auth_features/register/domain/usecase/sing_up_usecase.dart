import 'package:whatsapp_clone/features/auth_features/register/domain/repository/sing_up_repository.dart';

class SingUpUsecase {
  final SingUpRepository repository;

  SingUpUsecase(this.repository);

  Future<void> call(String email, String password) async {
    return await repository.signUp(email, password);
  }
}
