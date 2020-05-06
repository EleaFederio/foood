import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hatud_foods/Auth/login.dart';
import 'package:hatud_foods/body_contents/cart.dart';
import 'package:hatud_foods/body_contents/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_){
    runApp(MaterialApp(
      home: BootPage(),
    ));
  });

}

class BootPage extends StatefulWidget {
  @override
  _BootPageState createState() => _BootPageState();
}

class _BootPageState extends State<BootPage> {

  SharedPreferences sharedPreferences;

  int _currentIndex = 0;
  List<Widget> _children = [];
  List<Widget> _appBars = [];
  
  @override
  void initState() {
    _children.add(HomePage());
    _children.add(CartPage());
    _appBars.add(_buildAppBar());
    _appBars.add(_cartAppBar());
    super.initState();
    checkLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBars[_currentIndex],
      body: _children[_currentIndex],
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(90.0),
      child: Container(
        margin: EdgeInsets.only(top: 20.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Container(
            child: Card(
              child: Container(
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                      hintText: "Search products",
                      border: InputBorder.none,
                      suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.search))
                  ),
                ),
              ),
            ),
          ),
          leading: Image.network('https://pngimage.net/wp-content/uploads/2018/05/delivery-pizza-png.png'),
        ),
      ),
    );
  }

  Widget _cartAppBar(){
    AppBar(
      title: Text('My Cart'),
    );
  }

  BottomNavigationBar _bottomNavigationBar(){
    return BottomNavigationBar(
      onTap: _onTabTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.blueGrey,),
            title: Text('Home', style: TextStyle(color: Colors.blueGrey),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: Colors.blueGrey,),
            title: Text('Cart', style: TextStyle(color: Colors.blueGrey),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border, color: Colors.blueGrey,),
            title: Text('Favorite', style: TextStyle(color: Colors.blueGrey),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, color: Colors.blueGrey,),
            title: Text('My Account', style: TextStyle(color: Colors.blueGrey),),
          ),
        ]
    );
  }

  _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      print(_currentIndex);
    });
  }

  void checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") == null){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
    }
  }

}



