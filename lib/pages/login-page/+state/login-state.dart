import 'package:meta/meta.dart';

@immutable
class LoginState{

  final loadingStatus;
  final String email;
  final String token;

  LoginState({
    @required this.loadingStatus,
    @required this.email,
    @required this.token,
  });

  factory LoginState.initial(){
    return new LoginState(
      loadingStatus: false,
      email: "",
      token: "",
    );
  }

  LoginState copyWith({
    loadingStatus,
    String email,
    String token,
  }){
    return new LoginState(
        loadingStatus: loadingStatus ?? this.loadingStatus,
        email: email ?? this.email,
        token: token ?? this.token,
    );
  }
}