//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:idiary/add.dart';
//import 'package:idiary/viewall.dart';
//
//void main() => runApp(MaterialApp(
//  home: Operation(),
//  routes: <String,WidgetBuilder>{
//    "/AddNewRecord": (BuildContext context) => new RecordN(),
//    "/ViewAllPage" :(BuildContext context) => new ViewAll()
//  },
//));
//
//class Operation extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.transparent,
//
//      body: Container(
//        decoration: BoxDecoration(
//          image: DecorationImage(
//              image: AssetImage('assets/back3.jpg'),
//              fit: BoxFit.cover,
//              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop)
//          ),
//        ),
//        //padding: const EdgeInsets
//        child: Padding(
//            padding: const EdgeInsets.fromLTRB(50.0, 40.0, 50.0, 0),
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//
//                Center(
//                  child: Padding(
//                    padding: const EdgeInsets.fromLTRB(0, 75.0, 0, 100.0),
//                    child: Text(
//                      'My Diary',
//                      style: TextStyle(
//                        color: Colors.white,
//                        fontSize: 28.0,
//                        fontWeight: FontWeight.bold,
//                        letterSpacing: 0.5,
//                      ),
//                    ),
//                  ),
//                ),
//
//                SizedBox(height: 50.0),
//                Column(
//                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                  crossAxisAlignment: CrossAxisAlignment.stretch,
//                  children: <Widget>[
//                    FlatButton(
//                      child: Text(
//                        'Add Record',
//                        textAlign: TextAlign.center,
//                        style: TextStyle(
//                          color: Colors.white,
//                          letterSpacing: 1.0,
//                          fontSize: 15.0,
//                        ),
//                      ),
//                      color: Colors.transparent,
//                      shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(18.0),
//                        side: BorderSide(color: Colors.white),
//                      ),
//                      onPressed: () {
//                        Navigator.of(context).pushNamed("/AddNewRecord");
//                      },
//                    ),
//                    Divider(
//                      color: Colors.white,
//                      indent: 100.0,
//                      endIndent: 100.0,
//                      height: 50.0,
//                    ),
//                    SizedBox(height: 5.0),
//                    SizedBox(height: 5.0),
//                    FlatButton(
//                      child: Text(
//                        'View All Records',
//                        textAlign: TextAlign.center,
//                        style: TextStyle(
//                          color: Colors.white,
//                          letterSpacing: 1.0,
//                          fontSize: 15.0,
//                        ),
//                      ),
//                      color: Colors.transparent,
//                      shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(18.0),
//                        side: BorderSide(color: Colors.white),
//                      ),
//                      onPressed: () {
//                        Navigator.of(context).pushNamed("/ViewAllPage");
//                      },
//                    ),
//                    SizedBox(height: 20.0),
//                  ],
//                ),
//              ],
//            )
//        ),
//      ),
//    );
//  }
//}
