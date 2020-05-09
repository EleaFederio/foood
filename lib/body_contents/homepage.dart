import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:hatud_foods/api/CallApi.dart';
import 'package:hatud_foods/body_contents/foodDetails.dart';
import 'package:hatud_foods/body_contents/foodDetails.dart';
import 'package:http/http.dart' as http;

import 'foodDetails.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

//  final Orientation orientation = MediaQuery.of(context).orientation;

  Future<List<Categories>> _getCategories() async{
    var data = await http.get("http://192.168.254.102:8000/api/categories");
    var jsonData = json.decode(data.body);
    List<Categories> categories = [];
    for(var u in jsonData['data']){
      int id = u['id'];
      String name = u['name'];
      Categories categorie = Categories(id, name);
      categories.add(categorie);
    }
    return categories;
  }

  Future<List<Stores>> _getSeller() async{
    var data = await http.get("http://192.168.254.102:8000/api/seller");
    var jsonData = json.decode(data.body);
    List<Stores> foodStore = [];
    for(var u in jsonData['data']){
      String owner = u['firstName']+' '+u['lastName'];
      String name = u['businessName'];
      Stores foodBusiness = Stores(owner, name);
      foodStore.add(foodBusiness);
    }
    return foodStore;
  }

  Future<List<Foods>> _getFoods() async{
    var data = await http.get("http://192.168.254.102:8000/api/foods");
    var jsonData = json.decode(data.body);
    List<Foods> foodDetails = [];
    for(var u in jsonData['data']){
      int id = u['id'];
      String name = u['name'];
      String detail = u['detail'];
      String foodPicture = u['foodPicture'];
      String seller = u['seller'];
      String category = u['category'];
      String price = u['price'];
      int available = u['available'];
      Map href = u['href'];
      Foods foodBusiness = Foods(id, name, detail, foodPicture, seller, category, price, available, href);
      foodDetails.add(foodBusiness);
    }
    return foodDetails;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.yellow[400],
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
            child: Text(
              "Categories",
                style: Theme.of(context).textTheme.title,
            ),
          ),
          Container(
            width: double.infinity,
            height: 75,
            margin: EdgeInsets.only(top: 15),
            child: FutureBuilder(
              future: _getCategories(),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                if(snapshot.data == null){
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }else{
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index){
                        return _categoryList(snapshot.data[index].name);
                      }
                  );
                };
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
            child: Text(
              "Stores",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Container(
            width: double.infinity,
            height: 130,
            margin: EdgeInsets.only(top: 15),
            child: FutureBuilder(
              future: _getSeller(),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                if(snapshot.data == null){
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }else{
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index){
                        return _storesList(snapshot.data[index].name);
                      }
                  );
                }
              },
            ),
          ),
          SizedBox(height: 4,),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
            child: Text(
              "Foods",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Container(
            child: FutureBuilder(
              future: _getFoods(),
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  if(snapshot.data == null){
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }else{
                    return GridView.builder(
                      padding: EdgeInsets.all(5.0),
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data.length,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: MediaQuery.of(context).size.height / 900,
                          crossAxisSpacing: 5.0,
                          mainAxisSpacing: 5.0,
                        ),
                        itemBuilder: (BuildContext context, int index){
                          return GestureDetector(
                            onTap: () async {

                            Map aaaa = snapshot.data[index].href;
                              print("XXXXXXXXXXXXXXXXXXXXXXXXXX ${aaaa['show_food']}");
                              var data = await http.get(aaaa['show_food']);
                              var jsonData = json.decode(data.body);

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => FoodDetailsPage(jsonData)),
                              );
                            },
                            child: Column(
                              children: <Widget>[
                                Image(image: NetworkImage('https://food.fnr.sndimg.com/content/dam/images/food/fullset/2011/5/4/2/FNM_060111-Perfect-Patties-004_s4x3.jpg.rend.hgtvcom.826.620.suffix/1371597647270.jpeg'),),
                                SizedBox(height: 5,),
                                Text(
                                  snapshot.data[index].name,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10.0,),
                                Text(
                                  '₱ ${snapshot.data[index].price}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 18.0,
                                    color: Colors.red[900],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                    );
                  }
                }
            ),
          ),
        ],
      ),
    );
  }


  Widget _categoryList(String name){
    return InkWell(
      onTap: (){

      },
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black,
              image: DecorationImage(
                image: NetworkImage('https://www.bbcgoodfood.com/sites/default/files/recipe-collections/collection-image/2013/05/chorizo-mozarella-gnocchi-bake-cropped.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: 50,
            height: 50,
          ),
          SizedBox(
            height: 5,
          ),
          Text(name)
        ],
      ),
    );
  }

  Widget _storesList(String name){
    return InkWell(
      onTap: (){

      },
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black,
              image: DecorationImage(
                image: NetworkImage('https://image.freepik.com/free-vector/cartoon-hot-dog-seller-presenting-food_61878-737.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: 100,
            height: 100,
          ),
          SizedBox(
            height: 5,
          ),
          Text(name)
        ],
      ),
    );
  }
}


class Categories{
    final int id;
    final String name;
    Categories(this.id, this.name);
}

class Stores{
  final String owner;
  final String name;
  Stores(this.owner, this.name);
}

class Foods{
  final int id;
  final String name;
  final String detail;
  final String foodPicture;
  final String seller;
  final String category;
  final String price;
  final int available;
  final Map href;

  Foods(this.id, this.name, this.detail, this.foodPicture, this.seller, this.category,
      this.price, this.available, this.href);

}