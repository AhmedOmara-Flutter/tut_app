import 'package:tut_app/app/app_imports.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._networkInfo, this._remoteDataSource);

  @override
  Future<Either<Failure, Authentication>> login(
    LoginRequest loginRequest,
  ) async {
    if (await _networkInfo.isConnected) {
      //return success
      try {
        final response = await _remoteDataSource.login(loginRequest);
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(
              code: ApiInternalStatus.FAILURE,
              message: response.message ?? ResponseMessage.UNKNOWN,
            ),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      //return failure
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, Authentication>> register(
    RegisterRequest registerRequest,
  ) async {
    if (await _networkInfo.isConnected) {
      // return success
      try {
        final response = await _remoteDataSource.register(registerRequest);
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return left(
            Failure(
              code: ApiInternalStatus.FAILURE,
              message: response.message ?? ResponseMessage.UNKNOWN,
            ),
          );
        }
      } catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      //return network failure
      return left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
