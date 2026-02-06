import 'package:tut_app/app/app_imports.dart';
import 'package:retrofit/retrofit.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String? baseUrl}) = _AppServiceClient;

  @POST("/customers/login")
  Future<AuthenticationResponse> login(
    @Field('email') String email,
    @Field('password') String password,
  );

  @POST("/customers/register")
  Future<AuthenticationResponse> register(
    @Field('name') String name,
    @Field('mobileNumber') String mobileNumber,
    @Field('countryCode')String countryCode,
    @Field('email') String email,
    @Field('password') String password,
    @Field('profilePicture') String profilePicture,
  );
}


//dart run build_runner build --delete-conflicting-outputs
