import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idiary/add.dart';
import 'package:idiary/viewall.dart';
import 'package:idiary/services/auth.dart';

void main() => runApp(MaterialApp(
  home: Home(),
  routes: <String,WidgetBuilder>{
    "/AddNewRecord": (BuildContext context) => new RecordN(),
    "/ViewAllPage" :(BuildContext context) => new ViewAll()
  },
));

class Home extends StatefulWidget {
  Home();
  @override
  _Operation createState() => _Operation();
}

class _Operation extends State<Home> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('MyDiary', style: TextStyle(color: Colors.white, letterSpacing: 4.0,)),
        backgroundColor: Colors.blueGrey[900],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person, color: Colors.white,),
            label: Text('logout', style: TextStyle(color: Colors.white),),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/back3.jpg'),
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop)
          ),
        ),
        //padding: const EdgeInsets
        child: Padding(
            padding: const EdgeInsets.fromLTRB(50.0, 40.0, 50.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 50.0, 0, 100.0),
                    child: Text(
                      'My Diary',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    FlatButton(
                      child: Text(
                        'Add Record',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.0,
                          fontSize: 15.0,
                        ),
                      ),
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white),
                      ),
                      onPressed: () {
                        //Navigator.of(context).pushNamed("/AddNewRecord");
                        Navigator.push(context, new MaterialPageRoute(
                            builder: (context) =>
                            new NewRecord())
                        );
                      },
                    ),
                    Divider(
                      color: Colors.white,
                      indent: 100.0,
                      endIndent: 100.0,
                      height: 50.0,
                    ),
                    SizedBox(height: 5.0),
                    SizedBox(height: 5.0),
                    FlatButton(
                      child: Text(
                        'View All Records',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.0,
                          fontSize: 15.0,
                        ),
                      ),
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white),
                      ),
                      onPressed: () {
                        //Navigator.of(context).pushNamed("/ViewAllPage");
                        Navigator.push(context, new MaterialPageRoute(
                            builder: (context) =>
                            new ViewAll())
                        );
                      },
                    ),
                    SizedBox(height: 20.0),
                  ],
                ),
              ],
            )
        ),
      ),
    );
  }
}
