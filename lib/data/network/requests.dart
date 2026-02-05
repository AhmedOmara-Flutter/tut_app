class LoginRequest {
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});
}

class RegisterRequest {
  final String name;
  final String mobileNumber;
  final String email;
  final String password;
  final String profilePicture;

  RegisterRequest({required this.name, required this.mobileNumber, required this.email, required this.password, required this.profilePicture});

}