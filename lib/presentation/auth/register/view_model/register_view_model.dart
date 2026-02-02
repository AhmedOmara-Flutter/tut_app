import 'package:tut_app/app/app_imports.dart';

class RegisterViewModel extends BaseViewModel
    with RegisterViewModelInput, RegisterViewModelOutputs {
  final StreamController _nameStreamController =
      StreamController<String>.broadcast();
  final StreamController _mobileNumberStreamController =
      StreamController<String>.broadcast();
  final StreamController _emailStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();
  final StreamController _profilePictureStreamController =
      StreamController<String>.broadcast();
  final StreamController _allInputsValidStreamController =
      StreamController<void>.broadcast();

  var registerObject = RegisterObject(
    name: '',
    mobileNumber: '',
    email: '',
    password: '',
    profilePicture: '',
  );

  @override
  void start() {}

  @override
  void dispose() {
    _nameStreamController.close();
    _mobileNumberStreamController.close();
    _emailStreamController.close();
    _passwordStreamController.close();
    _profilePictureStreamController.close();
    super.dispose();
  }

  // inputs Function

  @override
  void setEmailInput(String email) {
    inputEmail.add(email);
    registerObject = registerObject.copyWith(email: email);
    allInputsValidInputs.add(null);
  }

  @override
  void setMobileNumberInput(String mobileNumber) {
    inputMobileNumber.add(mobileNumber);
    registerObject = registerObject.copyWith(mobileNumber: mobileNumber);
    allInputsValidInputs.add(null);
  }

  @override
  void setNameInput(String name) {
    inputName.add(name);
    registerObject = registerObject.copyWith(name: name);
    allInputsValidInputs.add(null);
  }

  @override
  void setPasswordInput(String password) {
    inputPassword.add(password);
    registerObject = registerObject.copyWith(password: password);
    allInputsValidInputs.add(null);
  }

  @override
  void setProfilePictureInput(String profilePicture) {
    inputProfilePicture.add(profilePicture);
    registerObject = registerObject.copyWith(profilePicture: profilePicture);
    allInputsValidInputs.add(null);
  }

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Sink get inputMobileNumber => _mobileNumberStreamController.sink;

  @override
  Sink get inputName => _nameStreamController.sink;

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputProfilePicture => _profilePictureStreamController.sink;

  @override
  Sink get allInputsValidInputs => _allInputsValidStreamController.sink;

  @override
  void login() {}

  //  outputs Function

  @override
  Stream<bool> get outPutEmailValid =>
      _emailStreamController.stream.map((email) => isEmailValid(email));

  @override
  Stream<bool> get outPutMobileNumberValid => _mobileNumberStreamController
      .stream
      .map((mobileNumber) => isMobileNumberValid(mobileNumber));

  @override
  Stream<bool> get outPutNameValid =>
      _nameStreamController.stream.map((name) => isNameValid(name));

  @override
  Stream<bool> get outPutPasswordValid => _passwordStreamController.stream.map(
    (password) => isPasswordValid(password),
  );

  @override
  Stream<bool> get outputProfilePicture => _profilePictureStreamController
      .stream
      .map((profilePicture) => isProfilePictureValid(profilePicture));

  @override
  Stream<bool> get allInputsValidOutputs =>
      _allInputsValidStreamController.stream.map((_) => areAllInputsValid());

  bool isNameValid(String name) {
    return name.isNotEmpty;
  }

  bool isMobileNumberValid(String mobileNumber) {
    return mobileNumber.isNotEmpty;
  }

  bool isEmailValid(String email) {
    return email.isNotEmpty;
  }

  bool isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool isProfilePictureValid(String profilePicture) {
    return profilePicture.isNotEmpty;
  }

  bool areAllInputsValid() {
    return isNameValid(registerObject.name) &&
        isMobileNumberValid(registerObject.mobileNumber) &&
        isEmailValid(registerObject.email) &&
        isPasswordValid(registerObject.password) &&
        isProfilePictureValid(registerObject.profilePicture);
  }
}

mixin RegisterViewModelInput {
  void setNameInput(String name);

  void setMobileNumberInput(String mobileNumber);

  void setEmailInput(String email);

  void setPasswordInput(String password);

  void setProfilePictureInput(String profilePicture);

  void login();

  Sink get inputName;

  Sink get inputMobileNumber;

  Sink get inputEmail;

  Sink get inputPassword;

  Sink get inputProfilePicture;

  Sink get allInputsValidInputs;
}

mixin RegisterViewModelOutputs {
  Stream<bool> get outPutNameValid;

  Stream<bool> get outPutMobileNumberValid;

  Stream<bool> get outPutEmailValid;

  Stream<bool> get outPutPasswordValid;

  Stream<bool> get outputProfilePicture;

  Stream<bool> get allInputsValidOutputs;
}
