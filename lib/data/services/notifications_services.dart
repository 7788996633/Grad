import 'dart:convert';

import 'package:graduated/constant.dart';
import 'package:http/http.dart' as http;

class NotificationsServices {
  Future<List> getAllNotifications() async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $myToken'
    };
    var request =
        http.MultipartRequest('GET', Uri.parse('${myUrl}notifications'));

    request.headers.addAll(headers);
    var streamedResponse = await request.send();

    var response = await http.Response.fromStream(streamedResponse);
    var jsonResponse = json.decode(response.body);
    print(jsonResponse);

    if (response.statusCode == 200) {
      return jsonResponse['notifications'];

      if (jsonResponse['status'] == 'success') {
      } else {
        return [];
      }
    } else {
      return [];
    }
  }
}
