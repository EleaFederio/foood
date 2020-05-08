import 'dart:convert';

import 'package:hatud_foods/backend/foodGridList.dart';
import 'package:http/http.dart' as http;

class ReadFoodsData{
    static const String url = "http://192.168.254.102:8000/api/foods";

    static Future<List<Foods>> getFoods() async{
      try{
        final response = await http.get(url);
        if(response.statusCode == 200){
          List<Foods> list = parseFoods(response.body);
          return list;
        }else{
          throw Exception("Error");
        }
      }catch(e){
        throw new Exception(e.toString());
      }
    }

    static List<Foods> parseFoods(String responseBody){
      final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
      return parsed.map<Foods>((json) => Foods.fromJson(json)).toList();
    }
}