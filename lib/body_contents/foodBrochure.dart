


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hatud_foods/backend/foodGridList.dart';

class FoodCell extends StatelessWidget {
  const FoodCell(this.food);

  @required
  final Foods food;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/image-loading.png",
                    image: "https://assets.biggreenegg.eu/app/uploads/2019/03/28145521/topimage-classic-hamburger-2019m04-800x534.jpg",
                    width: 100.0,
                    height: 100.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  food.name,
                  maxLines: 1,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 2,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  food.name,
                  maxLines: 1,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 7,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}
