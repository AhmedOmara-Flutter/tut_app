import 'package:tut_app/app/app_imports.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final RegisterViewModel _viewModel = instance<RegisterViewModel>();
  final ImagePicker _imagePicker = instance<ImagePicker>();
  String dialCode = "+20";

  void _bind() {
    _viewModel.start();
    _nameController.addListener(() {
      _viewModel.setNameInput(_nameController.text.trim());
    });
    _mobileNumberController.addListener(() {
      _viewModel.setMobileNumberInput(_mobileNumberController.text.trim());
    });
    _emailController.addListener(() {
      _viewModel.setEmailInput(_emailController.text.trim());
    });
    _passwordController.addListener(() {
      _viewModel.setPasswordInput(_passwordController.text.trim());
    });
    _viewModel.userRegisteredSuccessfullyStreamController.stream.listen((
      isRegistered,
    ) {
      if (isRegistered) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          instance<AppPreferences>().setLoginKey();
          Navigator.of(context).pushReplacementNamed(RoutesManager.mainRoute);
        });
      }
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FlowState>(
      stream: _viewModel.outputState,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return snapshot.data!.flowStateWidget(
            context,
            () {},
            getContentWidget(),
          );
        } else {
          return getContentWidget();
        }
      },
    );
  }

  Widget getContentWidget() {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(AppPaddingManager.p20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: AppPaddingManager.p35),
                    child: Center(child: Image.asset(ImageAssets.splashLogo)),
                  ),
                  // name
                  StreamBuilder(
                    stream: _viewModel.outPutNameError,
                    builder: (context, snapshot) {
                      return TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: StringManager.name,
                          errorText: snapshot.data,
                        ),
                      );
                    },
                  ),
                  SizedBox(height: AppSizeManager.s16),
                  // mobile number
                  StreamBuilder(
                    stream: _viewModel.outPutMobileNumberValid,
                    builder: (context, snapshot) {
                      return Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: CountryCodePicker(
                              onChanged: (country) {
                                setState(() {
                                  dialCode = country.dialCode??"+20";
                                });

                                _viewModel.setCountryCodeInput(country.dialCode??"+20");
                              },
                              flagWidth: AppSizeManager.s100,
                              initialSelection: 'EG',
                              favorite: const ['+39', 'FR', "+966"],
                              showCountryOnly: true,
                              hideMainText: true,
                              showOnlyCountryWhenClosed: true,
                              padding: EdgeInsetsGeometry.zero,
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Expanded(
                            flex: 3,
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              controller: _mobileNumberController,
                              decoration: InputDecoration(
                                prefix: Text(dialCode),
                                labelText: StringManager.mobileNumber,
                                errorText: snapshot.data == false
                                    ? StringManager.mobileNumberError
                                    : null,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: AppSizeManager.s16),
                  // email
                  StreamBuilder(
                    stream: _viewModel.outPutEmailValid,
                    builder: (context, snapshot) {
                      return TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: StringManager.email,
                          errorText: snapshot.data == false
                              ? StringManager.emailError
                              : null,
                        ),
                      );
                    },
                  ),
                  SizedBox(height: AppSizeManager.s16),
                  // password
                  StreamBuilder(
                    stream: _viewModel.outPutPasswordValid,
                    builder: (context, snapshot) {
                      return TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: StringManager.password,
                          errorText: snapshot.data == false
                              ? StringManager.passwordError
                              : null,
                        ),
                      );
                    },
                  ),
                  SizedBox(height: AppSizeManager.s16),
                  // profile picture
                  StreamBuilder(
                    stream: _viewModel.outputProfilePicture,
                    builder: (context, snapshot) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppPaddingManager.p18,
                        ),
                        width: double.infinity,
                        height: AppSizeManager.s55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            AppSizeManager.s12,
                          ),
                          border: Border.all(color: ColorManger.lightGrey),
                        ),
                        child: GestureDetector(
                          child: _getMediaWidget(),
                          onTap: () {
                            _showPicker(context);
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(height: AppSizeManager.s45),
                  // register button
                  StreamBuilder(
                    stream: _viewModel.allInputsValidOutputs,
                    builder: (context, snapshot) {
                      return ElevatedButton(
                        onPressed: snapshot.data == true
                            ? () {
                                if (_formKey.currentState!.validate()) {
                                  _viewModel.register();
                                }
                              }
                            : null,

                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(
                            double.infinity,
                            AppSizeManager.s55,
                          ),
                        ),
                        child: Text(StringManager.signUp),
                      );
                    },
                  ),
                  SizedBox(height: AppSizeManager.s16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        StringManager.haveAnAccount,
                        style: TextTheme.of(context).titleSmall,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(
                            context,
                          ).pushNamed(RoutesManager.loginRoute);
                        },
                        child: Text(
                          StringManager.login,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getMediaWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            'Profile Picture',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        Flexible(
          child: StreamBuilder<File>(
            stream: _viewModel.outputProfilePicture,
            builder: (context, snapshot) {
              if (snapshot.data != null && snapshot.data!.path.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppPaddingManager.p3,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppSizeManager.s12),
                    child: Image.file(snapshot.data!),
                  ),
                );
              }
              return Container();
            },
          ),
        ),
        Flexible(
          child: SvgPicture.asset(
            ImageAssets.photoCameraIc,
            height: AppSizeManager.s20,
          ),
        ),
      ],
    );
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSizeManager.s28),
                  topRight: Radius.circular(AppSizeManager.s28),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Material(
                  color: Colors.transparent,
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward),
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo From Gallery'),
                    onTap: () {
                      _imageFromGallery();
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
              ListTile(
                trailing: Icon(Icons.arrow_forward),
                leading: const Icon(Icons.camera_alt),
                title: const Text('Photo From Camera'),
                onTap: () {
                  _imageFromCamera();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _imageFromGallery() async {
    var image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _viewModel.setProfilePictureInput(File(image.path));
    }
  }

  void _imageFromCamera() async {
    var image = await _imagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      _viewModel.setProfilePictureInput(File(image.path));
    }
  }

  @override
  void dispose() {
    _nameController.clear();
    _emailController.clear();
    _passwordController.clear();
    _mobileNumberController.clear();
    super.dispose();
  }
}
