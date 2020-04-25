import 'package:flutter/material.dart';
import 'package:idiary/services/auth.dart';
import 'package:idiary/shared/loading.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Sky.jpg'),
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.9), BlendMode.dstATop)
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(70.0, 0, 70.0, 0),
            child: Column(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 300.0, 0, 0),
                    child: Text(
                      'My Diary',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        letterSpacing: 6.0,
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                    indent: 60.0,
                    endIndent: 60.0,
                    height: 60.0,
                  ),
                   Column(
                    children: <Widget>[
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 20.0),
                            TextFormField(textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.white70,
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.white, width: 0.0),
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(7.0)
                                  ),
                                ),

                                hintText: 'email',
                                hintStyle: TextStyle(fontSize: 15.0, color: Colors.white70, fontWeight: FontWeight.bold),
                              ),
                              validator: (val) => val.isEmpty ? 'Enter an email' : null,
                              onChanged: (val) {
                                setState(() => email = val);
                              },
                            ),
                            SizedBox(height: 20.0),
                            TextFormField(
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.left,
                              obscureText: true,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.vpn_key,
                                  color: Colors.white70,
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.white, width: 0.0),
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(7.0)
                                  ),
                                ),

                                hintText: 'password',
                                hintStyle: TextStyle(fontSize: 15.0, color: Colors.white70, fontWeight: FontWeight.bold),
                              ),
                              validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                              onChanged: (val) {
                                setState(() => password = val);
                              },
                            ),
                            SizedBox(height: 40.0),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                FlatButton(
                                    color: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.white),
                                    ),
                                    child: Text(
                                      'Register',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: 4.0,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    onPressed: () async {
                                      if(_formKey.currentState.validate()){
                                        setState(() => loading = true);
                                        dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                                        if(result == null) {
                                          setState(() {
                                            loading = false;
                                            error = 'Please supply a valid email';
                                          });
                                        }
                                      }
                                    }
                                ),

                              ],
                            ),
                            SizedBox(height: 20.0),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Divider(
                                    color: Colors.white,
                                    indent: 30.0,
                                    endIndent: 20.0,
                                    height: 60.0,
                                  ),
                                ),
                                Text(
                                  'Already a user?',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    letterSpacing: 2.0,
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    color: Colors.white,
                                    indent: 30.0,
                                    endIndent: 20.0,
                                    height: 60.0,
                                  ),
                                ),

                              ],
                            ),
                            FlatButton.icon(
                              icon: Icon(Icons.person, color: Colors.white70,),
                              label: Text('Sign In', style: TextStyle(color: Colors.white),),
                              onPressed: () => widget.toggleView(),
                            ),
                            SizedBox(height: 12.0),
                            Text(
                              error,
                              style: TextStyle(color: Colors.red, fontSize: 14.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                   ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}