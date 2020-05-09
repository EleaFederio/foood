import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hatud_foods/api/CallApi.dart';
import 'package:http/http.dart' as http;

class FoodDetailsPage extends StatelessWidget {

  final Map foodUrl;
  FoodDetailsPage(this.foodUrl);



  @override
  Widget build(BuildContext context) {

    print("PPPPPPPPPPPPPPPPPPPPPPPP ${foodUrl['data']['name']}");


    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.green,
        ),
        body: Container(
//          this.foodUrl['show_food']
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Card(
                          margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                          child: Container(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    IconButton(
                                      onPressed: (){

                                      },
                                      icon: Icon(Icons.favorite_border),
                                    )
                                  ],
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Image(image: NetworkImage('https://food.fnr.sndimg.com/content/dam/images/food/fullset/2011/5/4/2/FNM_060111-Perfect-Patties-004_s4x3.jpg.rend.hgtvcom.826.620.suffix/1371597647270.jpeg'),),
                                ),
                                SizedBox(height: 10.0,),
                                Container(
//                                  padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
                                  child: Text(
                                    foodUrl['data']['name'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.0,
                                    ),
                                  ),
                                ),
                                Container(
//                                  padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
                                  child: Text(
                                    "₱ ${foodUrl['data']['price']}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 30.0,
                                    ),
                                  ),
                                ),
                                Container(
//                                  color: Colors.grey,
                                  width: double.infinity,
                                  padding: EdgeInsets.only(left: 3.0, bottom: 0.0),
                                  child: Text(
                                    "Description:",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
                                  child: Text(
                                    "${foodUrl['data']['detail']}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      width: double.infinity,
                      child: MaterialButton(
                        height: 50.0,
                        color: Colors.green,
                        child: Text("Add to Cart".toUpperCase(), style: TextStyle(
                            color: Colors.white
                        ),),
                        onPressed: (){},
                      ),
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );



  }


}

class Foods{
  final int id;
  final String name;
  final String detail;
  final String foodPicture;

  Foods(this.id, this.name, this.detail, this.foodPicture);

}
