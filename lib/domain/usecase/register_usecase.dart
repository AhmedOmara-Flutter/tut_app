import 'package:dartz/dartz.dart';
import 'package:tut_app/app/app_imports.dart';

class RegisterUsecase implements BaseUseCase<RegisterUseCaseInput, Authentication> {
  final Repository _repository;

  RegisterUsecase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
    RegisterUseCaseInput input,
  ) async {
    return await _repository.register(
      RegisterRequest(
        name: input.name,
        mobileNumber: input.mobileNumber,
        email: input.email,
        password: input.password,
        profilePicture: input.profilePicture,
      ),
    );
  }
}

class RegisterUseCaseInput {
  final String name;
  final String mobileNumber;
  final String email;
  final String password;
  final String profilePicture;

  RegisterUseCaseInput({
    required this.name,
    required this.mobileNumber,
    required this.email,
    required this.password,
    required this.profilePicture,
  });
}
