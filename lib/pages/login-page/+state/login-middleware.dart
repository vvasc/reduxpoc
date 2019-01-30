import 'dart:convert';

import 'package:redux/redux.dart';
import 'package:reduxpoc/keys.dart';
import 'package:reduxpoc/pages/login-page/+state/login-actions.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:rxdart/rxdart.dart';
class LoginMiddleware extends MiddlewareClass {
  @override
  void call(Store store, action, NextDispatcher next) {
    if (action is LoginAction) {
      new Observable.fromFuture(rootBundle.loadString('assets/mock/token.json'))
        .map((data) => json.decode(data))
        .map((dynamic data) {
          if (data['accesstoken'] != null) {
            store.dispatch(new LoginSuccess(data));
          } else {
            store.dispatch(new LoginError());
          }
          return data;
      }).listen(print, onDone: () => print('done!'));
    }

    if (action is ForgotPasswordAction) {
      print(action);
    }

    if (action is LoginError) {
      print(action);
    }

    if (action is LoginSuccess) {
      Keys.navKey.currentState.pushNamed("home-page");
    }
    next(action);
  }
}