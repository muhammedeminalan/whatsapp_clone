import 'package:whatsapp_clone/features/auth_features/login/domain/repository/sign_in_repository.dart';

class SignInUsecase {
  final SignInRepository repository;

  SignInUsecase(this.repository);

  Future<void> call(String email, String password) {
    return repository.signIn(email, password);
  }
}
