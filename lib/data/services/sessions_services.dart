import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../constant.dart';

import '../models/sessions.dart';

class SessionServices {
  Future<List> getSessions() async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $myToken',
    };

    var request = http.MultipartRequest('GET', Uri.parse('${myUrl}sessions'));
    request.headers.addAll(headers);
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    var jsonResponse = json.decode(response.body);
    print(jsonResponse);

    if (response.statusCode == 200 && jsonResponse['status'] == 'success') {
      List data = jsonResponse['data'];
      return data.map((e) => Sessions.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<Sessions> getSessionById(int sessionId) async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $myToken',
    };

    var request = http.Request('GET', Uri.parse('${myUrl}sessions/$sessionId'));
    request.headers.addAll(headers);
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    var jsonResponse = json.decode(response.body);
    print(jsonResponse);

    if (response.statusCode == 200 && jsonResponse['status'] == 'success') {
      return Sessions.fromJson(jsonResponse['data']);
    } else {
      throw Exception('failed: ${jsonResponse['message']}');
    }
  }

  Future<String> createSession(
      String type, int lawyerId, int isAttend, int sessionId) async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $myToken',
    };

    var request =
    http.MultipartRequest('POST', Uri.parse('${myUrl}sessions/$sessionId'));
    request.fields.addAll({
      'type': type,
      'lawyerId': lawyerId.toString(),
      'isAttend': isAttend.toString(),

    });

    request.headers.addAll(headers);
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    var jsonResponse = json.decode(response.body);
    print(jsonResponse);

    if (response.statusCode == 200 && jsonResponse['status'] == 'success') {
      return jsonResponse['message'];
    } else {
      return 'failed: ${jsonResponse['message']}';
    }
  }

  Future<String> updateSession(
      String outcome, int isAttend, int sessionId) async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $myToken',
    };

    var request =
    http.Request('POST', Uri.parse('${myUrl}sessions/$sessionId'));
    request.bodyFields = {
      'outcome': outcome,
      'isAttend': isAttend.toString(),
    };

    request.headers.addAll(headers);
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    var jsonResponse = json.decode(response.body);
    print(jsonResponse);

    if (response.statusCode == 200 && jsonResponse['status'] == 'success') {
      return jsonResponse['message'];
    } else {
      return 'failed: ${jsonResponse['message']}';
    }
  }

  Future<String> deleteSession(int sessionId) async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $myToken',
    };

    var request =
    http.MultipartRequest('DELETE', Uri.parse('${myUrl}sessions/$sessionId'));
    request.headers.addAll(headers);
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    var jsonResponse = json.decode(response.body);
    print(jsonResponse);

    if (response.statusCode == 200 && jsonResponse['status'] == 'success') {
      return jsonResponse['message'];
    } else {
      return 'failed: ${jsonResponse['message']}';
    }
  }
}
