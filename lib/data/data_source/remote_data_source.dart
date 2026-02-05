import 'package:tut_app/app/app_imports.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);

  Future<AuthenticationResponse> register(RegisterRequest registerRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
      loginRequest.email,
      loginRequest.password,
    );
  }

  @override
  Future<AuthenticationResponse> register(
    RegisterRequest registerRequest,
  ) async {
    return await _appServiceClient.register(
      registerRequest.name,
      registerRequest.mobileNumber,
      registerRequest.email,
      registerRequest.password,
      registerRequest.profilePicture,
    );
  }
}
