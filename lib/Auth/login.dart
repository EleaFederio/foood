import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hatud_foods/Auth/register.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();


}

class _LoginPageState extends State<LoginPage> {

  String _password;
  bool _passwordVisible = true;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image(
                    width: double.infinity,
                    image: AssetImage('assets/login_head.png'),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 140),
                    child: Image(
                      height: 90,
                      image: AssetImage('assets/app_logo.png'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 100, left: 95),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Gubat Food",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,

                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Delivery",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,

                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Material(
                  elevation: 2.0,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: TextField(
                    onChanged: (String value){

                    },
                    cursorColor: Colors.green[700],
                    decoration: InputDecoration(
                      hintText: "Phone Number",
                      prefixIcon: Material(
                        elevation: 0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: Icon(
                          Icons.phone_iphone,
                          color: Colors.green[800],
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 13),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Material(
                  elevation: 2.0,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: TextFormField(
                    onChanged: (String value){},
                    cursorColor: Colors.green[800],
                    decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Material(
                          elevation: 0,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: Icon(
                            Icons.lock,
                            color: Colors.green[900],
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 25, vertical: 13
                        ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible ? Icons.visibility_off : Icons.visibility,
                          color: Colors.blueGrey,
                        ),
                        onPressed: (){
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      )
                    ),
                    validator: (val) => val.length < 8 ? 'Password to short' : null,
                    onSaved: (val) => _password = val,
                    obscureText: _passwordVisible,
                  ),
                ),
              ),
              SizedBox(
                height: 60.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: Colors.green[800],
                  ),
                  child: FlatButton(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18
                      ),
                    ),
                    onPressed: (){

                    },
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                child: Text(
                  'Create an Account',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'Forgot Password?',
                style: TextStyle(
                  fontSize: 15.0,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
    );
  }


}

