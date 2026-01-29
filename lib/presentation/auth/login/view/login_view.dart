import 'package:tut_app/app/app_imports.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final LoginViewModel _viewModel = instance<LoginViewModel>();

  void _bind() {
    _viewModel.start();
    _usernameController.addListener(() {
      _viewModel.setUserName(_usernameController.text);
    });
    _passwordController.addListener(() {
      _viewModel.setPassword(_passwordController.text);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _bind();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return getContentWidget();
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
                  padding: const EdgeInsets.symmetric(
                    vertical: AppPaddingManager.p60,
                  ),
                  child: Center(child: Image.asset(ImageAssets.splashLogo)),
                ),
                StreamBuilder(
                  stream: _viewModel.outPutUserNameValid,
                  builder: (context, snapshot) {
                    return TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: StringManager.userName,
                        errorText: snapshot.data == false
                            ? StringManager.userNameError
                            : null,
                      ),
                    );
                  },
                ),
                SizedBox(height: AppSizeManager.s20),
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
                SizedBox(height: AppSizeManager.s50),
                StreamBuilder(
                  stream: _viewModel.allInputsValidOutputs,
                  builder: (context, snapshot) {
                    return ElevatedButton(
                      onPressed: snapshot.data == true
                          ? () {
                              if (_formKey.currentState!.validate()) {
                                _viewModel.login();
                                Navigator.pushReplacementNamed(
                                  context,
                                  RoutesManager.mainRoute,
                                );
                              }
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, AppSizeManager.s55),
                      ),
                      child: Text(StringManager.login),
                    );
                  },
                ),
                SizedBox(height: AppSizeManager.s20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StringManager.forgetPassword,
                      style: TextTheme.of(context).titleSmall,
                    ),
                    Text(
                      StringManager.notAMember,
                      style: TextTheme.of(context).titleSmall,
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
    // TODO: implement dispose
    _viewModel.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
