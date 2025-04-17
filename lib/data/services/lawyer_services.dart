import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constant.dart';

class LawyerServices {
  Future createLawerProfile(
    String licenseNumber,
    String experienceYears,
    String specialization,
    String certificatePath,
  ) async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $myToken'
    };

    var request =
        http.MultipartRequest('POST', Uri.parse('${myUrl}lawyers/create'));
    request.fields.addAll({
      'license_number': licenseNumber,
      'experience_years': experienceYears,
      'specialization': specialization,
      'certificate': certificatePath,
      'type': 'lawyer',
      'salary': '12000'
    });

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
