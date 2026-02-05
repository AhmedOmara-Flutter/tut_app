import 'package:tut_app/app/app_imports.dart';
import 'package:dartz/dartz.dart';


abstract class Repository {

  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);

  Future<Either<Failure, Authentication>> register(RegisterRequest registerRequest);
}

