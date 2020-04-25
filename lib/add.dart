
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idiary/record.dart';
import 'package:idiary/viewall.dart';
import 'package:idiary/screens/home/home.dart';
import 'package:idiary/services/auth.dart';


void main() => runApp(RecordN());

class RecordN extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NewRecord(),
      routes: <String,WidgetBuilder>{
        "/ViewAllPage": (BuildContext context) => new ViewAll(),
        "/GuestPage" :(BuildContext context) => new Home()
      },
    );
  }
}

class NewRecord extends StatefulWidget {
  NewRecord();
  @override
  _NewRecordState createState() => _NewRecordState();
}

class _NewRecordState extends State<NewRecord> {
  final AuthService _auth = AuthService();

  String date,content;

  getRecordDate(date){
    this.date=date;
  }
  getRecordContent(content){
    this.content=content;
  }

  insertData(){
    DocumentReference ds=Firestore.instance.collection('records').document(date);
    Map<String,dynamic> rec={
      "date":date,
      "content":content,

    };
    ds.setData(rec).whenComplete((){
      print("record update");
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('MyDiary', style: TextStyle(color: Colors.white, letterSpacing: 4.0,)),
        backgroundColor: Colors.blueGrey[900],
        elevation: 0.0,
        actions: <Widget>[
        ],
      ),
      body: Column(
        children: <Widget>[
          //_myAppBar(),


          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/sky2.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
              ),


            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height-81,
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 40.0,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0,0.0, 0, 0.0),
                    child: Text(
                      'Add Diary Entry',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: TextField(
                    onChanged: (String date){
                      getRecordDate(date);
                    },
                    decoration: InputDecoration(
                        labelText: "Date: ",
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "Add Date",
                        border:
                        OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                            borderSide: const BorderSide(color: Colors.white, width: 0.0),)

                    ),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: TextField(
                    maxLines: 8,
                    decoration: InputDecoration(
                      labelText: "Content: ",
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "Add content",
                        border:
                        OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0),
                          borderSide: const BorderSide(color: Colors.white, width: 0.0),)


                    ),
                    onChanged: (String content){
                      getRecordContent(content);
                    },
                  ),
                ),

                SizedBox(
                  height: 40.0,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    FlatButton(
                      child: Text(
                        'Cancel',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
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
                        //Navigator.of(context).pushNamed("/GuestPage");
                        Navigator.push(context, new MaterialPageRoute(
                            builder: (context) =>
                            new Home())
                        );
                      },
                    ),
                    FlatButton(
                      child: Text(
                        'Submit',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
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
                        insertData();
                        //Navigator.of(context).pushNamed("/ViewAllPage");
                        Navigator.push(context, new MaterialPageRoute(
                            builder: (context) =>
                            new ViewAll())
                        );
                      },
                    ),

                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
