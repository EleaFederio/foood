import 'dart:convert';

import 'package:device_info/device_info.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:hatud_foods/Auth/login.dart';
import 'package:hatud_foods/api/CallApi.dart';
import 'package:hatud_foods/body_contents/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _password;
  bool _passwordVisible;
  bool _confirmPasswordVisible;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();

  bool _isLoading = false;

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
        body: DoubleBackToCloseApp(
          child: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image(
                    width: double.infinity,
                    image: AssetImage('assets/login_head.png'),
                  ),
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
                        controller: firstNameController,
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
                        controller: lastNameController,
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
                        controller: phoneNumberController,
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
                        controller: passwordController,
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
                        controller: passwordConfirmationController,
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
                      _isLoading ? "Creating Account..." : "Register",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18
                      ),
                    ),
                    onPressed: _isLoading ? null : _handleLogin,
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
          snackBar: const SnackBar(content: Text('Tap back again to leave')),
        ),
      ),
    );
  }

  void _handleLogin() async{
    setState(() {
      _isLoading = true;
    });

    Future<String> _getPhoneId() async{
      DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
      if(Theme.of(context).platform == TargetPlatform.iOS){
        IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;
        return iosDeviceInfo.identifierForVendor;
      }else{
        AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
        return androidDeviceInfo.androidId;
      }
    }

    String deviceId = await _getPhoneId();


    var data = {
      'firstName' : firstNameController.text,
      'lastName' : lastNameController.text,
      'phoneNumber' : phoneNumberController.text,
      'password' : passwordController.text,
      'password_confirmation' : passwordConfirmationController.text,
      'deviceId' :  deviceId,
    };

    print("XXXXXXXXXXX $data");

    var res = await CallApi().postData(data, 'customer_register');
    var user = json.decode(res.body);
    print(user['success']);
    if(user['success']){
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', user['token']);
      localStorage.setString('student', json.encode(user['customer']));
      Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    }
    setState(() {
      _isLoading = false;
    });
    print(user);


  }
}
