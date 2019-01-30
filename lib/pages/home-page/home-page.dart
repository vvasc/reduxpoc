import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  static String tag = 'home-page';
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {
    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Bem Vindo',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.lightBlueAccent,
        ]),
      ),
      child: Column(
        children: <Widget>[welcome],
      ),
    );

    return Scaffold(
      body: body,
    );
  }
}