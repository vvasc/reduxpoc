import 'package:reduxpoc/app-state.dart';
import 'package:reduxpoc/pages/login-page/+state/login-reducers.dart';

AppState reducers(AppState state, dynamic action) => 
  new AppState(
    loginState: loginReducer(state.loginState, action),
  );