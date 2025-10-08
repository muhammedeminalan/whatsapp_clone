abstract class AuthBase {
  Future<void> signUp(String email, String password);
  Future<void> signIn(String email, String password);
  Future<void> signOut();
}
