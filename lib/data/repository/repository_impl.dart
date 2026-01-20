import 'package:dartz/dartz.dart';
import 'package:tut_app/data/network/error_handler.dart';
import 'package:tut_app/data/network/failure.dart';
import 'package:tut_app/data/network/requests.dart';
import 'package:tut_app/domain/model/models.dart';
import 'package:tut_app/domain/repository/repository.dart';
import '../data_source/remote_data_source.dart';
import '../mapper/mapper.dart';
import '../network/network_info.dart';

class RepositoryImpl implements Repository {
  final NetworkInfo _networkInfo;
  final RemoteDataSource _remoteDataSource;

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
      return Left(DataSource.INTERNAL_SERVER_ERROR.getFailure());
    }
  }
}
