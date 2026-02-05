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
  final TextEditingController _profilePictureController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();

  final RegisterViewModel _viewModel = instance<RegisterViewModel>();

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
    _profilePictureController.addListener(() {
      _viewModel.setProfilePictureInput(_profilePictureController.text.trim());
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
        }else{
          return getContentWidget();
        }
      });
  }
  Widget getContentWidget() {
    return Scaffold(
      body: SingleChildScrollView(
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
                  stream: _viewModel.outPutNameValid,
                  builder: (context, snapshot) {
                    return TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: StringManager.name,
                        errorText: snapshot.data == false
                            ? StringManager.nameError
                            : null,
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
                        Image.asset(
                          ImageAssets.egyptFlag,
                          width: AppSizeManager.s45,
                        ),
                        SizedBox(width: 10.0,),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: _mobileNumberController,
                            decoration: InputDecoration(
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
                    return TextFormField(
                      controller: _profilePictureController,
                      decoration: InputDecoration(
                        labelText: StringManager.profilePicture,
                        errorText: snapshot.data == false
                            ? StringManager.profilePictureError
                            : null,
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
                        minimumSize: Size(double.infinity, AppSizeManager.s55),
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
                      onPressed: () {},
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
    );
  }

  @override
  void dispose() {
    _nameController.clear();
    _emailController.clear();
    _passwordController.clear();
    _mobileNumberController.clear();
    _profilePictureController.clear();
    super.dispose();
  }
}
