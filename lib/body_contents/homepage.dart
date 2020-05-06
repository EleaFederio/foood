import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (BuildContext context, int index){
                return _categoryList();
              }
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
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (BuildContext context, int index){
                  return _storesList();
                }
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
//          Products
          GridView.count(
            padding: EdgeInsets.all(5.0),
            crossAxisCount: 2,
            physics: ScrollPhysics(),
            shrinkWrap: true,
            childAspectRatio: MediaQuery.of(context).size.height/800,
            crossAxisSpacing: 10.0,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Image(image: NetworkImage('https://food.fnr.sndimg.com/content/dam/images/food/fullset/2011/5/4/2/FNM_060111-Perfect-Patties-004_s4x3.jpg.rend.hgtvcom.826.620.suffix/1371597647270.jpeg'),),
                  SizedBox(height: 5,),
                  Text('Yummy Burger'),
                  SizedBox(height: 10.0,),
                  Text('P,57.75'),
                ],
              ),
              Column(
                children: <Widget>[
                  Image(image: NetworkImage('https://food.fnr.sndimg.com/content/dam/images/food/fullset/2011/5/4/2/FNM_060111-Perfect-Patties-004_s4x3.jpg.rend.hgtvcom.826.620.suffix/1371597647270.jpeg'),),
                  SizedBox(height: 5,),
                  Text('Yummy Burger'),
                  SizedBox(height: 10.0,),
                  Text('P,57.75'),
                ],
              ),
              Column(
                children: <Widget>[
                  Image(image: NetworkImage('https://food.fnr.sndimg.com/content/dam/images/food/fullset/2011/5/4/2/FNM_060111-Perfect-Patties-004_s4x3.jpg.rend.hgtvcom.826.620.suffix/1371597647270.jpeg'),),
                  SizedBox(height: 5,),
                  Text('Yummy Burger'),
                  SizedBox(height: 10.0,),
                  Text('P,57.75'),
                ],
              ),
              Column(
                children: <Widget>[
                  Image(image: NetworkImage('https://food.fnr.sndimg.com/content/dam/images/food/fullset/2011/5/4/2/FNM_060111-Perfect-Patties-004_s4x3.jpg.rend.hgtvcom.826.620.suffix/1371597647270.jpeg'),),
                  SizedBox(height: 5,),
                  Text('Yummy Burger'),
                  SizedBox(height: 10.0,),
                  Text('P,57.75'),
                ],
              ),
              Column(
                children: <Widget>[
                  Image(image: NetworkImage('https://food.fnr.sndimg.com/content/dam/images/food/fullset/2011/5/4/2/FNM_060111-Perfect-Patties-004_s4x3.jpg.rend.hgtvcom.826.620.suffix/1371597647270.jpeg'),),
                  SizedBox(height: 5,),
                  Text('Yummy Burger'),
                  SizedBox(height: 10.0,),
                  Text('P,57.75'),
                ],
              ),
              Column(
                children: <Widget>[
                  Image(image: NetworkImage('https://food.fnr.sndimg.com/content/dam/images/food/fullset/2011/5/4/2/FNM_060111-Perfect-Patties-004_s4x3.jpg.rend.hgtvcom.826.620.suffix/1371597647270.jpeg'),),
                  SizedBox(height: 5,),
                  Text('Yummy Burger'),
                  SizedBox(height: 10.0,),
                  Text('P,57.75'),
                ],
              ),
              Column(
                children: <Widget>[
                  Image(image: NetworkImage('https://food.fnr.sndimg.com/content/dam/images/food/fullset/2011/5/4/2/FNM_060111-Perfect-Patties-004_s4x3.jpg.rend.hgtvcom.826.620.suffix/1371597647270.jpeg'),),
                  SizedBox(height: 5,),
                  Text('Yummy Burger'),
                  SizedBox(height: 10.0,),
                  Text('P,57.75'),
                ],
              ),
              Column(
                children: <Widget>[
                  Image(image: NetworkImage('https://food.fnr.sndimg.com/content/dam/images/food/fullset/2011/5/4/2/FNM_060111-Perfect-Patties-004_s4x3.jpg.rend.hgtvcom.826.620.suffix/1371597647270.jpeg'),),
                  SizedBox(height: 5,),
                  Text('Yummy Burger'),
                  SizedBox(height: 10.0,),
                  Text('P,57.75'),
                ],
              ),
            ],
          ),


        ],
      ),
    );
  }

  Widget _categoryList(){
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
          Text("Category")
        ],
      ),
    );
  }

  Widget _storesList(){
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
          Text("Store")
        ],
      ),
    );
  }
}
