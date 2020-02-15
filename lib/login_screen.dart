import 'package:flutter/material.dart';

import 'principal_screen.dart';

class ScreenLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Login();
  }
}

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginView();
  }
}

class LoginView extends State<Login> {
  TextEditingController user = new TextEditingController();
  TextEditingController password = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),
        title: Text('Sing In'),
        backgroundColor: Color.fromARGB(500, 254, 161, 136),
      ),
      body: Builder(builder: (context) => _login()),
    );
  }

  Widget _login() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 18.0, right: 80.0, left: 80.0),
          child: Image.asset('assets/images/logo.png'),
        ),
        _textField('User', user, false),
        _textField('Password', password, true),
        _button()
      ],
    );
  }

  Widget _textField(String s, TextEditingController c, bool isPass) {
    return Padding(
        padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0),
        child: TextField(
          obscureText: isPass,
          controller: c,
          textAlignVertical: TextAlignVertical.center,
          showCursor: false,
          style: TextStyle(color: Color.fromARGB(500, 254, 161, 136)),
          decoration: InputDecoration(
            labelText: s,
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Color.fromARGB(500, 254, 161, 136), width: 2.0),
              borderRadius: BorderRadius.circular(15.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Color.fromARGB(500, 254, 161, 136), width: 2.0),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          textAlign: TextAlign.center,
        ));
  }

  Widget _button() {
    return Padding(
        padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
        child: Container(
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              color: Color.fromARGB(500, 254, 161, 136),
            ),
            child: RawMaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0),
                ),
                onPressed: () => _loginAction(context),
                child: Center(
                  child: Text('Login',
                      style: TextStyle(color: Colors.white, fontSize: 16.0)),
                ))));
  }

  void _loginAction(BuildContext context) {
    if (user.text == "" || password.text == "") {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Warning!"),
            content: new Text("Somethings fields are empty"),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PrincipalScreen()));
    }
  }
}
