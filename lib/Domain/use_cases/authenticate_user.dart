import '../repositories/authentication_repository.dart';

class AuthenticateUserUseCase {
  final AuthenticationRepository repository;

  AuthenticateUserUseCase(this.repository);

  Future<bool> execute({required String username, required String password}) {
    return repository.authenticate(username: username, password: password);
  }
}