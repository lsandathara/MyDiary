import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Record {
  String date;
  String content;
  DocumentReference reference;

  Record({this.date, this.content});

  Record.fromMap(Map<String, dynamic> map, {this.reference}){
    date = map["date"];
    content = map["content"];
  }

  Record.fromSnapShot(DocumentSnapshot snapshot)
      :this.fromMap(snapshot.data, reference: snapshot.reference);

  toJson() {
    return {'date': date, 'content': content};
  }



}