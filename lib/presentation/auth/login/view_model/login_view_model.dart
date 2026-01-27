import 'package:tut_app/domain/usecase/login_usecase.dart';
import 'package:tut_app/presentation/base/base_view_model.dart';
import '../../../common/freezed_data_classes.dart';
import 'dart:async';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInput, LoginViewModelOutputs {
  final LoginUseCase _loginUseCase;
  LoginViewModel(this._loginUseCase);


  final StreamController _userNameStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();
  final StreamController _allInputsValidStreamController =
      StreamController<void>.broadcast();

  var loginObject = LoginObject(userName: '', password: '');

  // inputs Functions
  @override
  void start() {}

  @override
  void dispose() {
    _userNameStreamController.close();
    _passwordStreamController.close();
    _allInputsValidStreamController.close();
  }

  @override
  void login() async {
    // (await _loginUseCase.execute(
    //   LoginUseCaseInput(
    //     email: loginObject.userName,
    //     password: loginObject.password,
    //   ),
    // )).fold((failure) {}, (data) {});
  }

  @override
  void setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
    allInputsValidInputs.add(null);
  }

  @override
  void setUserName(String userName) {
    inputUserName.add(userName);
    loginObject = loginObject.copyWith(userName: userName);
    allInputsValidInputs.add(null);
  }

  @override
  Sink<dynamic> get inputPassword => _passwordStreamController.sink;

  @override
  Sink<dynamic> get inputUserName => _userNameStreamController.sink;

  @override
  Sink<dynamic> get allInputsValidInputs =>
      _allInputsValidStreamController.sink;

  // outPuts Functions

  @override
  Stream<bool> get outPutPasswordValid => _passwordStreamController.stream.map(
    (password) => isPasswordValid(password),
  );

  @override
  Stream<bool> get outPutUserNameValid => _userNameStreamController.stream.map(
    (userName) => isUserNameValid(userName),
  );

  @override
  Stream<bool> get allInputsValidOutputs =>
      _allInputsValidStreamController.stream.map((_) => areAllInputsValid());

  bool areAllInputsValid() {
    return isPasswordValid(loginObject.password) &&
        isUserNameValid(loginObject.userName);
  }
}

bool isPasswordValid(String password) {
  return password.isNotEmpty;
}

bool isUserNameValid(String userName) {
  return userName.isNotEmpty;
}

mixin LoginViewModelInput {
  void setUserName(String userName);

  void setPassword(String password);

  void login();

  Sink get inputUserName;

  Sink get inputPassword;

  Sink get allInputsValidInputs;
}

mixin LoginViewModelOutputs {
  Stream<bool> get outPutUserNameValid;

  Stream<bool> get outPutPasswordValid;

  Stream<bool> get allInputsValidOutputs;
}
