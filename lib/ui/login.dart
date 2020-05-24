import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginState();
  }
}

class LoginState extends State<Login> {
  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passController = new TextEditingController();

  String _helloUser = "";

  void _clear() {
    setState(() {
      _userController.clear();
      _passController.clear();

      _helloUser = "Cleared!";
    });
  }

  void _showUser() {
    setState(() {
      if (_userController.text.isNotEmpty && _passController.text.isNotEmpty) {
        _helloUser = "Welcome,  " + _userController.text + "!";
      } else
        _helloUser = "Please login properly!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Login"),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: new Container(
            alignment: Alignment.topCenter,
            child: new Column(
              children: <Widget>[
                //image here
                new Image.asset(
                  'images/user.png',
                  width: 90.0,
                  height: 90.0,
                  color: Colors.blue,
                ),
                //form
                new Container(
                  height: 180.0,
                  width: 380.0,
//                  color: Colors.blueGrey.shade200,
                  child: new Column(
                    children: <Widget>[
                      new TextField(
                        controller: _userController,
                        decoration: new InputDecoration(
                            hintText: 'Username', icon: new Icon(Icons.person)),
                      ),
                      new TextField(
                        controller: _passController,
                        decoration: new InputDecoration(
                            hintText: 'Password',
                            icon: new Icon(Icons.visibility_off)),
                        obscureText: true,
                      ),
                      new Padding(padding: new EdgeInsets.all(10.5)),
                      new Center(
                        child: new Row(
                          children: <Widget>[
                            //login button
                            new Container(
                              margin: const EdgeInsets.only(left: 38.0),
                              child: new RaisedButton(
                                  onPressed: _showUser,
                                  color: Colors.blueAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  child: new Text("Login",
                                      style: new TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.9))),
                            ),

                            //Clear button
                            new Container(
                              margin: const EdgeInsets.only(left: 138.0),
                              child: new RaisedButton(
                                  onPressed: _clear,
                                  color: Colors.redAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  child: new Text("Clear",
                                      style: new TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.9))),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                //Welcome text
                new Padding(padding: const EdgeInsets.all(14.0)),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      "$_helloUser",
                      style: new TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 16.9,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                )
              ],
            )));
  }
}
