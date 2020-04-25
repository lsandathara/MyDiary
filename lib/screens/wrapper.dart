import 'package:flutter/material.dart';
import 'package:idiary/models/user.dart';
import 'package:idiary/screens/authenticate/authenticate.dart';
import 'package:idiary/screens/authenticate/sign_in.dart';
import 'package:provider/provider.dart';
import 'home/home.dart';
import 'package:idiary/guestpage.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);

    // return either the Home or Authenticate widget
    if (user == null){
      return Authenticate();
    } else {
      return Home();
    }

  }
}