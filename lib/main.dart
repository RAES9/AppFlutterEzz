import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(500, 254, 161, 136),
        systemNavigationBarColor: Color.fromARGB(500, 254, 161, 136)));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome :v',
      home: Screen(),
      theme: ThemeData(primaryColor: Colors.black),
    );
  }
}

class Screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PrincipalScreen();
  }
}

class PrincipalScreen extends State<Screen> {
  TextEditingController user = new TextEditingController();
  TextEditingController password = new TextEditingController();
  bool login = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _login(),
    );
  }

  Widget _login() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 18.0, right: 24.0, left: 24.0),
          child: Image.asset('assets/images/logo.png'),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 150.0, right: 70.0, left: 70.0),
          child: Text(
            "You're about to start journey to a healther happie you!",
            style: TextStyle(color: Colors.grey, fontSize: 17.0),
            textAlign: TextAlign.center,
          ),
        ),
        _button(Color.fromARGB(500, 254, 161, 136),
            Color.fromARGB(500, 254, 161, 136), Colors.white, 'Sing In', true),
        _button(Color(0x00000000), Color.fromARGB(500, 254, 161, 136),
            Color.fromARGB(500, 254, 161, 136), 'Sing Up', false),
        Padding(
          padding: EdgeInsets.only(top: 16.0),
          child: Text('Already have an account?',
              style: TextStyle(color: Colors.grey, fontSize: 14.0)),
        ),
      ],
    );
  }

  Widget _button(Color colorButton, Color colorBorder, Color colorFont,
      String title, bool l) {
    return Padding(
        padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0),
        child: Container(
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              color: colorButton,
              border: Border.all(color: colorBorder),
            ),
            child: RawMaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0),
                ),
                onPressed: l ? loginAction : registerAction,
                child: Center(
                  child: Text(title,
                      style: TextStyle(color: colorFont, fontSize: 18.0)),
                ))));
  }

  void loginAction() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ScreenLogin()));
  }

  void registerAction() {}
}
