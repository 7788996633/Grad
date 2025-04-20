import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

import '../../blocs/add_lawyer_sheet/add_lawyer_event.dart';

class AddLawyerService {
  Future<bool> uploadLawyerData(SubmitLawyerData event, int userId, String token) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://192.168.43.216:8000/api/lawyers/create/$userId'),
      );

      // إضافة البيانات النصية
      request.fields.addAll({
        'license_number': event.licenseNumber,
        'experience_years': event.experienceYears,
        'specialization': event.specialization,
        'salary': event.salary,
        'type': event.type,
      });


      request.fields['certificate'] = event.filePath!;

      request.headers.addAll(headers);

      print("Sending request to server...");
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      print("Raw response body: ${response.body}");
      final jsonResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        if (jsonResponse['status'] == 'success') {
          print(" Lawyer data uploaded successfully.");
          return true;
        } else {
          final message = jsonResponse['message'] ?? 'Unknown server error';
          print(" Server error: $message");
          throw Exception(message);
        }
      } else {
        print("HTTP error: ${response.statusCode} - ${response.reasonPhrase}");
        print("Response body: ${response.body}");
        throw Exception('Server error: ${jsonResponse['message'] ?? response.reasonPhrase}');
      }
    } catch (e) {
      print("Exception caught during upload: $e");
      throw Exception('Upload failed: $e');
    }
  }
}
