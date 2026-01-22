import 'dart:async';

import 'package:tut_app/presentation/base/base_view_model.dart';

import '../../../common/freezed_data_classes.dart';


class LoginViewModel extends BaseViewModel
    with LoginViewModelInput, LoginViewModelOutputs {
  final StreamController _userNameStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();

  var loginObject = LoginObject(userName: '', password: '');

  // inputs Functions
  @override
  void start() {}

  @override
  void dispose() {
    _userNameStreamController.close();
    _passwordStreamController.close();
  }

  @override
  void login() {}

  @override
  void setPassword(String password) {
    inputPassword.add(password);
  }

  @override
  void setUserName(String userName) {
    inputUserName.add(userName);
  }

  @override
  Sink<dynamic> get inputPassword => _passwordStreamController.sink;

  @override
  Sink<dynamic> get inputUserName => _userNameStreamController.sink;

  // outPuts Functions

  @override
  Stream<bool> get outPutPasswordValid => _passwordStreamController.stream.map(
    (password) => isPasswordValid(password),
  );

  @override
  Stream<bool> get outPutUserNameValid => _userNameStreamController.stream.map(
    (userName) => isUserNameValid(userName),
  );

  bool isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool isUserNameValid(String userName) {
    return userName.isNotEmpty;
  }
}

mixin LoginViewModelInput {
  void setUserName(String userName);

  void setPassword(String password);

  void login();

  Sink get inputUserName;

  Sink get inputPassword;
}

mixin LoginViewModelOutputs {
  Stream<bool> get outPutUserNameValid;

  Stream<bool> get outPutPasswordValid;
}
