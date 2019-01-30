import 'package:redux/redux.dart';
import 'package:reduxpoc/pages/login-page/+state/login-actions.dart';
import 'package:reduxpoc/pages/login-page/+state/login-state.dart';

final loginReducer = combineReducers<LoginState>([
  TypedReducer<LoginState,LoginAction>(_loginAction),
  TypedReducer<LoginState,ForgotPasswordAction>(_forgotPasswordAction),
  TypedReducer<LoginState,LoginError>(_loginError),
  TypedReducer<LoginState,LoginSuccess>(_loginSuccess),
]);

LoginState _loginAction(LoginState state, LoginAction action) => state;

LoginState _forgotPasswordAction(LoginState state, ForgotPasswordAction action) => state;

LoginState _loginError(LoginState state, LoginError action) => state;

LoginState _loginSuccess(LoginState state, LoginSuccess action) {
  return state.copyWith(loadingStatus: false, email: action.token['email'], token: action.token['accesstoken']);
}
