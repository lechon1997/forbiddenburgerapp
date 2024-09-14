abstract class AuthenticationRepository {
  Future<bool> authenticate({required String username, required String password});
  Future<void> logOut();
}