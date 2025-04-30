import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constant.dart';
import '../models/user_profile_model.dart';

class UserProfileServices {
  Future<UserProfileModel> showProfile() async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $myToken'
    };
    var request = http.Request('GET', Uri.parse('${myUrl}myprofile'));
    request.headers.addAll(headers);
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    var jsonResponse = json.decode(response.body);
    print(jsonResponse);
    if (response.statusCode == 200) {
      print(myToken);
      if (jsonResponse['status'] == 'success') {
        return UserProfileModel.fromJson(jsonResponse['data']);
      } else {print(myToken);
        throw Exception('failed: ${jsonResponse['message']}');
        //زبط بحيث اذا فشل يرجع ايدي سالب وخزن السبب واعرضو لا تنسى
      }
    } else {
      throw Exception(
          'failed: ${response.statusCode} - ${response.reasonPhrase}');
    }
  }

  Future<dynamic> updateProfile(
      String phone, String address, String age, String scientificLevel) async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $myToken'
    };
    var request = http.Request('POST', Uri.parse('${myUrl}profile/update'));
    request.bodyFields = {
      'phone': phone,
      'address': address,
      'age': age,
      'scientificLevel': scientificLevel
    };
    request.headers.addAll(headers);
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    var jsonResponse = json.decode(response.body);
    print(jsonResponse);
    if (response.statusCode == 200) {
      if (jsonResponse['status'] == 'success') {
        return jsonResponse['message'];
      } else {
        return 'failed: ${jsonResponse['message']}';
      }
    } else {
      return 'failed: ${response.statusCode} - ${response.reasonPhrase}';
    }
  }

  Future<String> createProfile(String phone, String address, String age,
      String scientificLevel, String imagePath) async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $myToken'
    };
    var request =
        http.MultipartRequest('POST', Uri.parse('${myUrl}profiles/create'));
    request.fields.addAll(
      {
        'phone': phone,
        'address': address,
        'age': age,
        'scientificLevel': scientificLevel
      },
    );
    request.files.add(await http.MultipartFile.fromPath('image', imagePath));

    request.headers.addAll(headers);
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    var jsonResponse = json.decode(response.body);
    print(jsonResponse);
    if (response.statusCode == 200) {
      if (jsonResponse['status'] == 'success') {
        return jsonResponse['message'];
      } else {
        return 'failed: ${jsonResponse['message']}';
      }
    } else {
      return 'failed: ${response.statusCode} - ${response.reasonPhrase}';
    }
  }

  Future<String> deleteProfile() async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $myToken'
    };
    var request = http.Request('DELETE', Uri.parse('${myUrl}profile'));
    request.headers.addAll(headers);
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    var jsonResponse = json.decode(response.body);
    print(jsonResponse);
    if (response.statusCode == 200) {
      if (jsonResponse['status'] == 'success') {
        return jsonResponse['message'];
      } else {
        return 'failed: ${jsonResponse['message']}';
      }
    } else {
      return 'failed: ${response.statusCode} - ${response.reasonPhrase}';
    }
  }
}
