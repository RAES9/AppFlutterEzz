import 'package:flutter/material.dart';

class PrincipalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Principal();
  }
}

class Principal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PricipalView();
  }
}

class PricipalView extends State<Principal> {
  final _songs = <Widget>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) => _music()),
    );
  }

  Widget _music() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 80.0, left: 24.0, right: 80.0),
                child: Image.asset('assets/images/gm.png'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0, left: 24.0, right: 80.0),
                child: Text(
                    'Start your morning off with a little inspiration, motivation, and meditation.',
                    style: TextStyle(color: Colors.grey, fontSize: 17.0)),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
                  child: _buildSongs())
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0))),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSongs() {
    for (var i = 0; i < 10; i++) {
      _songs.add(_buildRowSong());
    }
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 200.0,
      child: ListView(scrollDirection: Axis.horizontal, children: _songs),
    );
  }

  Widget _buildRowSong() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        width: 120.0,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bosque.jpg"),
              fit: BoxFit.cover,
            ),
            color: Color.fromARGB(500, 254, 161, 136),
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 32.0, left: 16.0),
              child: Text(
                'Relax',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 60.0, left: 16.0),
              child: Text(
                '30 MIN',
                style: TextStyle(color: Colors.white, fontSize: 14.0),
              ),
            ),
            Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                        height: 35.0,
                        width: 35.0,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.all(Radius.circular(17.5)),
                        ),
                        child: Center(
                          child: Icon(Icons.play_arrow),
                        ))))
          ],
        ),
      ),
    );
  }
}
