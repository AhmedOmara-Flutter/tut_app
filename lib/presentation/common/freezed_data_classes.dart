import 'package:tut_app/app/app_imports.dart';

part 'freezed_data_classes.freezed.dart';

@freezed
abstract class LoginObject with _$LoginObject {
  factory LoginObject({required String userName, required String password}) =
      _LoginObject;
}

@freezed
abstract class RegisterObject with _$RegisterObject {
  factory RegisterObject({
    required String name,
    required String mobileNumber,
    required String email,
    required String password,
    required String profilePicture,
  }) = _Register;
}
