import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class HttpLogic {
  Future<bool> postRequest(String text);
}

class HttpException implements Exception {}

class SimpleHttpLogic extends HttpLogic {
  String url = 'http://192.168.43.89:4000/detect';
  @override
  Future<bool> postRequest(String text) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"value":"$text"}';
    http.Response response = await http.post(this.url, headers: headers, body: json);
    Map<String, dynamic> x =
        jsonDecode(response.body); //Convierte una cadena en JSON
    print(x);
    List list = x['words'] as List;
    print(list[0]);
    if (list[0] != null) {
      print('verdadero');
      return true;
    } else {
      print('falso');
      return false;
    }
  }
}
