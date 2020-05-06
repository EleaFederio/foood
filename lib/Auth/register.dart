import 'package:flutter/material.dart';
import 'package:hatud_foods/Auth/login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _password;
  bool _passwordVisible;
  bool _confirmPasswordVisible;

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
//                Container(
//                  margin: EdgeInsets.only(top: 10, left: 140),
//                  child: Image(
//                    height: 90,
//                    image: AssetImage('assets/app_logo.png'),
//                  ),
//                ),
                Container(
                  margin: EdgeInsets.only(top: 60.0),
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: <Widget>[

                      Text(
                        "Registration Form",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,

                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 116.0),
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: TextField(
                      onChanged: (String value){

                      },
                      cursorColor: Colors.green[700],
                      decoration: InputDecoration(
                        hintText: "First Name",
                        prefixIcon: Material(
                          elevation: 0,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: Icon(
                            Icons.account_circle,
                            color: Colors.green[800],
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 13),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 184.0),
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: TextField(
                      onChanged: (String value){

                      },
                      cursorColor: Colors.green[700],
                      decoration: InputDecoration(
                        hintText: "Last Name",
                        prefixIcon: Material(
                          elevation: 0,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: Icon(
                            Icons.account_circle,
                            color: Colors.green[800],
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 13),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 252.0),
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

                Container(
                  margin: EdgeInsets.only(top: 320),
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
                Container(
                  margin: EdgeInsets.only(top: 388),
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: TextFormField(
                      obscureText: true,
                      onChanged: (String value){},
                      cursorColor: Colors.green[800],
                      decoration: InputDecoration(
                          hintText: "Password Confirmation",
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
                      ),
                    ),
                  ),
                ),
              ],
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
                    "Register",
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
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text(
                'Have an Account? Sign In.',
                style: TextStyle(
                  fontSize: 15.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
