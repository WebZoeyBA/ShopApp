// ignore: file_names
class RegisterClass {
  String username;
  String email;
  String password;
  String rePassword;
  RegisterClass(
      {this.username = '',
      this.email = '',
      this.password = '',
      this.rePassword = ''});

  RegisterClass copyWith({
    String? username,
    String? email,
    String? password,
    String? rePassword,
  }) {
    return RegisterClass(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      rePassword: rePassword ?? this.rePassword,
    );
  }
}
