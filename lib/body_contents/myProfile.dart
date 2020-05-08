import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hatud_foods/Auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  var userData;

  @override
  void initState() {
    // checkLoginStatus();
    _getUserInfo();
    super.initState();
  }

  _getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var studentJson = localStorage.getString('users');
    var user = json.decode(studentJson);
    setState(() {
      userData = user;
      print("  XXXXXXXXXXXXXXXXXXXXXXX ${userData}  XXXXXXXXXXXXXX");
    });
  }

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(12.921715, 124.123165),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {


    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          SizedBox(
            height: 250,
            width: double.infinity,
            child: Image(image: NetworkImage('https://images.vexels.com/media/users/3/188725/list/5fff959b5afa9135669c1f574da21d80-coleccion-de-ilustracion-de-comida-mexicana.jpg'),),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(16.0, 200.0, 16.0, 16.0),
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(16.9),
                      margin: EdgeInsets.only(top: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 96.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  userData != null? "${userData['firstName']} ${userData['lastName']}" : "Firstname Lastname",
                                  style: Theme.of(context).textTheme.title,
                                ),
                                ListTile(
                                  contentPadding: EdgeInsets.all(0),
                                  title: Text('Phone Number'),
                                  subtitle: Text('Address Here'),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text('Some Text'),
                                    Text('Text Again'),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text('Some Text'),
                                    Text('Text Again'),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text('Some Text'),
                                    Text('Text Again'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 80.0,
                      width: 80.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: NetworkImage('https://avatars2.githubusercontent.com/u/26576307?s=460&u=4aa9fbd0b2eb952293e6a70757b2cc54f42ad330&v=4'),
                          fit: BoxFit.cover,
                        )
                      ),
                      margin: EdgeInsets.only(left: 16.0),
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text('User Information'),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Phone Number:'),
                        subtitle: Text('+639385784607'),
                        leading: Icon(Icons.phone),
                      ),
                      ListTile(
                        title: Text('Email:'),
                        subtitle: Text('myamazingemail@email.com'),
                        leading: Icon(Icons.email),
                      ),
                      ListTile(
                        title: Text('Address:'),
                        subtitle: Text('Amazing St. Gubat, Sorsogon'),
                        leading: Icon(Icons.location_on),
                      ),
                      Divider(),
                      Text(
                        'Select your GPS location.',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      SizedBox(
                          width: MediaQuery.of(context).size.width,  // or use fixed size like 200
                          height: 300.0,
                          child: GoogleMap(
                            mapType: MapType.normal,
                            initialCameraPosition: _kGooglePlex,
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void checkLoginStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") == null){
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage() ));
//        _showAuthAlert(context);
    }
  }

  void _showAuthAlert(BuildContext context){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Not yet a member'),
        content: Text('Register now to order foods! :)'),
        actions: [
          FlatButton(
              onPressed: null,
              child: Text('No'),
          ),
          FlatButton(
            onPressed: null,
            child: Text('Yes'),
          )
        ],
      )
    );
  }

}
