import 'package:meta/meta.dart';
import 'package:reduxpoc/pages/login-page/+state/login-state.dart';

@immutable
class AppState{

  final LoginState loginState;

  AppState({
    @required this.loginState,
  });

  factory AppState.initial() {
    return AppState(
      loginState: LoginState.initial(),
    );
  }

  AppState copyWith({
    LoginState loginState,
  }){
    return AppState(
      loginState: loginState ?? this.loginState,
    );
  }
}