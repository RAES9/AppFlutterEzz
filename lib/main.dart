import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome :v',
      home: RandomWords(),
      theme: ThemeData(
        primaryColor: Colors.black
      ),
    );
  }
}

class RandomWords extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return RandomWordsStates();
  }
}

class RandomWordsStates extends State<RandomWords>{
  TextEditingController user = new TextEditingController();
  TextEditingController password = new TextEditingController();
  @override 
  Widget build(BuildContext context){
    return Scaffold(
        body: _login(),
    );
  }

  Widget _login(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(20.0),
            child: Text('Welcome!', style: TextStyle(
            fontSize: 35.0,
            fontWeight: FontWeight.bold,
            shadows: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 0)),
            ]
          )),
        ),
        _textField('User', user, false),
        _textField('Password', password, true),
        _button()
      ],
    );
  }

  Widget _textField(String s, TextEditingController c, bool isPass){
    final _heightT = 50.0;
    return Padding(
      padding: EdgeInsets.only(
        left: 24.0,
        right: 24.0,
        top: 8.0
      ),
      child: Container(
        height: _heightT,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(_heightT/2)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            spreadRadius: 0.2,
            blurRadius: 5,
            offset: Offset(0, 0)),
          ]
        ),
        child: TextField(   
          obscureText: isPass,
          controller: c,
          textAlignVertical: TextAlignVertical.center,
          showCursor: false,
          decoration: InputDecoration(
          hintText: s,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(_heightT/2))
            )
          ),
          textAlign: TextAlign.center,
        ),
      )
    );
  }

  Widget _button(){
    return Padding(padding: EdgeInsets.only(
        left: 50.0,
        right: 50.0,
        top: 16.0),
        child: Container(
          height: 40.0,
          decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Colors.blue,
          boxShadow: [
            BoxShadow(
            color: Colors.grey.withOpacity(0.8),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 0)),
            ]
          ),
          child: RawMaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20.0),
            ),
            onPressed: loginAction,
            child: Center(
              child: Text('Login', style: TextStyle(
              color: Colors.white,
              fontSize: 16.0
            )),
          )
        )
      )
    );  
  }

  void loginAction(){
    print('User ' + user.text);
    print('Pass ' + password.text);
  }
}
