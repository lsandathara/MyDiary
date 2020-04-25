import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idiary/record.dart';
import 'package:idiary/add.dart';
import 'package:idiary/screens/home/home.dart';
import 'package:idiary/services/auth.dart';

void main() => runApp(MaterialApp(
  home: ViewAll(),

));
class ViewAll extends StatefulWidget {

  @override
  _ViewAllSate createState() => _ViewAllSate();
}

class _ViewAllSate extends State<ViewAll> {
  final AuthService _auth = AuthService();

  TextEditingController _textController = TextEditingController();
  String date, content;
  String _searchDateText = "";
  List dates = new List(); // names we get from API
  List datefilter = new List(); // names filtered by search text
//  Icon _searchIcon = new Icon(Icons.search);
//  Widget _appBarTitle = new Text( 'Search Example' );
  bool showTextField  =false;
  TextEditingController controller = TextEditingController();
  TextEditingController cont2 = TextEditingController();
  bool isEditing = false;
  Record thisRecord;

  getRecordDate(date) {
    this.date = date;
  }

  getRecordContent(content) {
    this.content = content;
  }

  viewAllRecords(){
    return Firestore.instance.collection('records').snapshots();
  }

  viewSingleRecord(Record record){
    controller.text = record.content;
//    cont2.text = record.date;

    setState((){
      showTextField  =true;
      isEditing = true;
      thisRecord = record;
    });
  }
  final List<String> _listViewData = [
    "14th January 2020",
    "21st January 2020",
    "14th February 2020",
    "2nd March 2020",
  ];
  final List<String> _Datelist = [];


  List<String> _newData = [];

  _onChanged(String value) {

    setState(() {
      _newData = _Datelist.where((string) =>
          string.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }

  Widget buildBody(BuildContext context){
    return StreamBuilder<QuerySnapshot>(
      stream: viewAllRecords(),
      builder: (context,snapshot){
        if(snapshot.hasError){
          return Text('Error ${snapshot.error}');
        }
        if(snapshot.hasData){
          print("Documents ${snapshot.data.documents.length}");
          return buildList(context,snapshot.data.documents);
        }
        return CircularProgressIndicator();
      },
    );
  }

  Widget buildList(BuildContext context, List<DocumentSnapshot> snapshot){
    return ListView(
      children: snapshot.map((data)=> buildListItem(context,data)).toList(),
    );
  }

  Widget buildListItem(BuildContext context,DocumentSnapshot data){
    final record = Record.fromSnapShot(data);
    return Padding(
      key:ValueKey(record.date),
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color:Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(record.date),
          subtitle: Text(record.content),

          onTap: (){
            viewSingleRecord(record);
          },

        ),

//
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          title: Text('My Diary', style: TextStyle(color: Colors.white, letterSpacing: 4.0,)),
          backgroundColor: Colors.blueGrey[900],
          elevation: 0.0,
          actions: <Widget>[

            IconButton(
            icon: Icon(Icons.home),
            onPressed: (){
              //Navigator.of(context).pushNamed("/GuestPage");
              Navigator.push(context, new MaterialPageRoute(
                  builder: (context) =>
                  new Home())
              );
            },
          ),
            FlatButton.icon(
              icon: Icon(Icons.person, color: Colors.white,),
              label: Text('logout', style: TextStyle(color: Colors.white),),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
        body:Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/Flower.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.9), BlendMode.dstATop)
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(70.0, 50.0, 70.0, 0),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 15.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        controller: _textController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white70,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white, width: 0.0),
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(7.0)
                            ),
                          ),

                          hintText: 'Enter date',
                          hintStyle: TextStyle(fontSize: 15.0, color: Colors.white70, fontWeight: FontWeight.bold),
                        ),
                        onChanged: _onChanged,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    _newData != null && _newData.length != 0
                        ? Expanded(
                      child: ListView(
                        padding: EdgeInsets.all(10.0),
                        children: _newData.map((data) {
                          return ListTile(title: Text(data, style: TextStyle(color: Colors.white)));
                        }).toList(),
                      ),
                    )
                        : SizedBox(),
                    Text(
                      "-----------------------------------------",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                    ),
                    Text(thisRecord.date,
                      style: TextStyle(
                        color: Color(0xFF000099),
                        letterSpacing: 1.0,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //Text(thisRecord.content),
                    Text(thisRecord.content,
                      style: TextStyle(
                        color: Colors.black87,
                        letterSpacing: 1.0,
                        fontSize: 18.0,
                      ),
                    ),
//
                    Text(
                      "-----------------------------------------",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    // button(),

              SizedBox(
                height: 40,
              ),
              Text(
                "DIARY RECORDS",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height:20,
              ),
              Flexible(
                child: buildBody(context),
              ),
                  ],
                )


              ),
            ),



        ),
      ),
    );
  }
}