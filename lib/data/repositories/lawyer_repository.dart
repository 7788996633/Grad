import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../model/lawyer_model.dart';

class LawyerRepository {
  final String baseUrl = 'http://192.168.43.216:8000/api';

  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<List<Lawyer>> fetchAllLawyers() async {
    final token = await _getToken();
    if (token == null) throw Exception('Token not found');

    final response = await http.get(
      Uri.parse('$baseUrl/lawyers'),
      headers: {'Authorization': 'Bearer $token'},
    );

    print("Fetch All Lawyers - Status Code: ${response.statusCode}");
    print("Fetch All Lawyers - Body: ${response.body}");

    final data = json.decode(response.body);
    if (response.statusCode == 200) {
      List lawyersJson = data['data'];
      return lawyersJson.map((json) => Lawyer.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load lawyers');
    }
  }

  Future<Lawyer> fetchLawyerById(int id) async {
    final token = await _getToken();
    if (token == null) throw Exception('Token not found');

    final response = await http.get(
      Uri.parse('$baseUrl/lawyers/$id'),
      headers: {'Authorization': 'Bearer $token'},
    );

    print("Fetch Lawyer by ID $id - Status Code: ${response.statusCode}");
    print("Fetch Lawyer by ID $id - Body: ${response.body}");

    final data = json.decode(response.body);
    if (response.statusCode == 200) {
      return Lawyer.fromJson(data['data']);
    } else {
      throw Exception('Failed to load lawyer');
    }
  }

  Future<Lawyer> fetchProfile() async {
    final token = await _getToken();
    if (token == null) throw Exception('Token not found');

    final response = await http.get(
      Uri.parse('$baseUrl/lawyer/profile'),
      headers: {'Authorization': 'Bearer $token'},
    );

    print("Fetch Profile - Status Code: ${response.statusCode}");
    print("Fetch Profile - Body: ${response.body}");

    final data = json.decode(response.body);
    if (response.statusCode == 200) {
      return Lawyer.fromJson(data['data']);
    } else {
      throw Exception('Failed to load profile');
    }
  }

  Future<Lawyer> updateSalary(String salary) async {
    final token = await _getToken();
    if (token == null) throw Exception('Token not found');

    final response = await http.post(
      Uri.parse('$baseUrl/lawyer/profile'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode({'salary': salary}),
    );

    print("Update Salary - Status Code: ${response.statusCode}");
    print("Update Salary - Body: ${response.body}");

    final data = json.decode(response.body);
    if (response.statusCode == 200) {
      return Lawyer.fromJson(data['data']);
    } else {
      throw Exception('Failed to update salary');
    }
  }
}
