class LoginAction {
  final userLogin;
  LoginAction(this.userLogin);
}

class LoginError { }

class ForgotPasswordAction { }

class LoginSuccess {
  final token;
  LoginSuccess(this.token);
}
