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
      StreamController<File>.broadcast();
  final StreamController _allInputsValidStreamController =
      StreamController<void>.broadcast();
  final StreamController userRegisteredSuccessfullyStreamController =
      StreamController<bool>();

  final RegisterUsecase _registerUsecase;

  RegisterViewModel(this._registerUsecase);

  var registerObject = RegisterObject(
    name: '',
    mobileNumber: '',
    countryCode: '',
    email: '',
    password: '',
    profilePicture: '',
  );

  // inputs Function

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    _nameStreamController.close();
    _mobileNumberStreamController.close();
    _emailStreamController.close();
    _passwordStreamController.close();
    _profilePictureStreamController.close();
    _allInputsValidStreamController.close();
    userRegisteredSuccessfullyStreamController.close();
    super.dispose();
  }

  @override
  void register() async {
    inputState.add(
      LoadingState(stateRenderType: StateRenderType.popUpLoadingState),
    );
    (await _registerUsecase.execute(
      RegisterUseCaseInput(
        name: registerObject.name,
        mobileNumber: registerObject.mobileNumber,
        countryCode: registerObject.countryCode,
        email: registerObject.email,
        password: registerObject.password,
        profilePicture: registerObject.profilePicture,
      ),
    )).fold(
      (failure) {
        inputState.add(
          ErrorState(StateRenderType.popUpErrorState, failure.message),
        );
      },
      (data) {
        inputState.add(ContentState());
        userRegisteredSuccessfullyStreamController.add(true);
      },
    );
  }

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
  void setCountryCodeInput(String countryCode) {
    registerObject = registerObject.copyWith(countryCode: countryCode);
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
  void setProfilePictureInput(File profilePicture) {
    inputProfilePicture.add(profilePicture);
    registerObject = registerObject.copyWith(
      profilePicture: profilePicture.path,
    );
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

  //  outputs Function
  @override
  Stream<bool> get outPutNameValid =>
      _nameStreamController.stream.map((name) => isNameValid(name));

  @override
  Stream<String?> get outPutNameError =>
      outPutNameValid.map((name) => name ? null : StringManager.nameError);

  @override
  Stream<bool> get outPutEmailValid =>
      _emailStreamController.stream.map((email) => isEmailValid(email));

  @override
  Stream<bool> get outPutMobileNumberValid => _mobileNumberStreamController
      .stream
      .map((mobileNumber) => isMobileNumberValid(mobileNumber));

  @override
  Stream<bool> get outPutPasswordValid => _passwordStreamController.stream.map(
    (password) => isPasswordValid(password),
  );

  @override
  Stream<File> get outputProfilePicture =>
      _profilePictureStreamController.stream.map((file) => file);

  @override
  Stream<bool> get allInputsValidOutputs =>
      _allInputsValidStreamController.stream.map((_) => areAllInputsValid());

  bool isNameValid(String name) {
    return name.isNotEmpty;
  }

  bool isMobileNumberValid(String mobileNumber) {
    return mobileNumber.length >= 10 &&
        mobileNumber.isNotEmpty &&
        mobileNumber.contains(RegExp(StringManager.regExp));
  }

  bool isEmailValid(String email) {
    return email.isNotEmpty && email.contains('@');
  }

  bool isPasswordValid(String password) {
    return password.isNotEmpty && password.length >= 6;
  }

  bool isProfilePictureValid(File profilePicture) {
    return profilePicture.path.isNotEmpty;
  }

  bool areAllInputsValid() {
    return registerObject.name.isNotEmpty &&
        registerObject.mobileNumber.isNotEmpty &&
        registerObject.email.isNotEmpty &&
        registerObject.countryCode.isNotEmpty &&
        registerObject.password.isNotEmpty;
  }
}

mixin RegisterViewModelInput {
  void setNameInput(String name);

  void setMobileNumberInput(String mobileNumber);

  void setCountryCodeInput(String countryCode);

  void setEmailInput(String email);

  void setPasswordInput(String password);

  void setProfilePictureInput(File profilePicture);

  void register();

  Sink get inputName;

  Sink get inputMobileNumber;

  Sink get inputEmail;

  Sink get inputPassword;

  Sink get inputProfilePicture;

  Sink get allInputsValidInputs;
}

mixin RegisterViewModelOutputs {
  Stream<bool> get outPutNameValid;

  Stream<String?> get outPutNameError;

  Stream<bool> get outPutMobileNumberValid;

  Stream<bool> get outPutEmailValid;

  Stream<bool> get outPutPasswordValid;

  Stream<File> get outputProfilePicture;

  Stream<bool> get allInputsValidOutputs;
}
