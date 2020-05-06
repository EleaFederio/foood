import 'dart:convert';

import 'package:http/http.dart' as http;

class CallApi{
  final String _url = 'http://192.168.254.102:8000/api/';

  postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    print(fullUrl);
    return http.post(fullUrl, body: json.encode(data), headers: _setHeaders());
  }

  getData(apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.get(fullUrl, headers: _setHeaders());
  }

  _setHeaders() => {
    'Content-type' : 'application/json',
    'Accept' : 'application/json'
  };
}