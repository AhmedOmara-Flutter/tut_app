import 'package:tut_app/app/app_imports.dart';
part 'freezed_data_classes.freezed.dart';

@freezed
abstract class LoginObject with _$LoginObject {
  factory LoginObject({
    required String userName,
    required String password
  }) =_LoginObject;
}
