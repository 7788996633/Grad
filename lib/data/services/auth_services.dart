import 'dart:convert';

import 'package:graduated/constant.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  Future<String> login(String email, String password) async {
    var headers = {'Accept': 'application/json'};
    var request = http.MultipartRequest('POST', Uri.parse('${myUrl}login'));
    request.fields.addAll({'email': email, 'password': password});

    request.headers.addAll(headers);

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    var jsonResponse = json.decode(response.body);
    print(jsonResponse);

    if (response.statusCode == 200) {
      if (jsonResponse['status'] == 'success') {
        return jsonResponse['data']['token'];
      } else {
        return jsonResponse['message'];
      }
    } else {
      return 'failed: ${response.statusCode} - ${response.reasonPhrase}';
    }
  }

  Future register(String email, String name, String password) async {
    var headers = {'Accept': 'application/json'};
    var request = http.MultipartRequest('POST', Uri.parse('${myUrl}register'));
    request.fields.addAll({'name': name, 'email': email, 'password': password});

    request.headers.addAll(headers);

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    var jsonResponse = json.decode(response.body);
    print(jsonResponse);

    if (response.statusCode == 200) {
      if (jsonResponse['status'] == 'success') {
        return jsonResponse['data']['token'];
      } else {
        return jsonResponse['message'];
      }
    } else {
      return 'failed: ${response.statusCode} - ${response.reasonPhrase}';
    }
  }
}
