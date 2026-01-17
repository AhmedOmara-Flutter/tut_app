import 'package:dartz/dartz.dart';
import 'package:tut_app/data/network/requests.dart';
import 'package:tut_app/domain/model/models.dart';
import '../../data/network/failure.dart';

abstract class Repository {

  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);

}