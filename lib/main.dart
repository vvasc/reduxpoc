import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:reduxpoc/app-state.dart';
import 'package:reduxpoc/app-reducers.dart';
import 'package:reduxpoc/keys.dart';
import 'package:reduxpoc/pages/home-page/home-page.dart';
import 'package:reduxpoc/pages/login-page/+state/login-middleware.dart';
import 'package:reduxpoc/pages/login-page/login-page.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(),
  };

  final store = new Store<AppState>(
    reducers,
    initialState: AppState.initial(),
    middleware: [
      LoginMiddleware(),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      store: store,
      child: new MaterialApp(
        title: 'POC REDUX',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.amber,
          fontFamily: 'Roboto',
        ),
      navigatorKey: Keys.navKey,
      home: LoginPage(),
      routes: routes,
      ),
    );
  }
}