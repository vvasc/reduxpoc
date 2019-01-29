import 'package:redux/redux.dart';
import 'package:reduxpoc/pages/login-page/+state/login-actions.dart';

class LoginMiddleware extends MiddlewareClass {

  @override
  void call(Store store, action, NextDispatcher next) {
    if (action is LoginAction) {
      print('middle');
    }

    if (action is ForgotPasswordAction) {
      print(action);
    }

    if (action is LoginError) {
      print(action);
    }
    next(action);
  }
}