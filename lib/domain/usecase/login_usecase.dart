import 'package:tut_app/app/app_imports.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication> {
  final Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
    LoginUseCaseInput input,
  ) async {
    return await _repository.login(
      LoginRequest(email: input.email, password: input.password),
    );
  }
}

class LoginUseCaseInput {
  final String email;
  final String password;

  LoginUseCaseInput({required this.email, required this.password});
}
