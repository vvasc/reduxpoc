import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:reduxpoc/app-state.dart';
import 'package:reduxpoc/pages/login-page/+state/login-actions.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formLogin = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'POC REDUX',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png'),
      ),
    );

    final form = Form(
      key: formLogin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            validator: (value) {
              Pattern pattern =
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regex = new RegExp(pattern);
              if (value.isEmpty) 
                return 'Por favor digite um e-mail';
              if (!regex.hasMatch(value))
                return 'Entre com um e-mail válido';
            },
            decoration: InputDecoration(
              hintText: 'Email',
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            ),
          ), 
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0),
          ),
          TextFormField(
            controller: passwordController,
            autofocus: false,
            obscureText: true,
            validator: (value) {
              if (value.isEmpty) {
                return 'Por favor digite uma senha';
              }
            },
            decoration: InputDecoration(
              hintText: 'Password',
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            ),
          ),
        ],
      )
    );


    final loginButton = new StoreConnector<AppState, dynamic>(
      converter: (store) {
        return (formText) => store.dispatch(LoginAction(formText));
      },
      builder: (context, dispatchLoginAction) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            onPressed: () {
              if (formLogin.currentState.validate()) {
                var formText = { "email": emailController.text,  "password": passwordController.text };
                dispatchLoginAction(formText);
              }
            },
            padding: EdgeInsets.all(12),
            color: Colors.green,
            child: Text('Log In', style: TextStyle(color: Colors.white)),
          ),
        );
      },
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );
   
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            form,
            SizedBox(height: 8.0),
            loginButton,
            forgotLabel
          ],
        ),
      ),
    );
  }
}