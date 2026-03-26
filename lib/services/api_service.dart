import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = "https://simba-39la.onrender.com/api";

  static Future<Map<String, dynamic>> register(String email, String password, String fullname) async {
    final url = Uri.parse('$baseUrl/users/register');
    final response = await http.post(url, body: {
      'email': email,
      'password': password,
      'fullname': fullname,
    });

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to register: ${response.body}');
    }
  }

  static Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/users/login');
    final response = await http.post(url, body: {
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Login failed: ${response.body}');
    }
  }



  /// 👤 PROFILE
  static Future<Map<String, dynamic>> getProfile(String token) async {
    final res = await http.get(
      Uri.parse("$baseUrl/api/profile"),
      headers: {"Authorization": "Bearer $token"},
    );

    return jsonDecode(res.body);
  }

  /// 🐶 PETS
  static Future<List<dynamic>> getPets(String token) async {
    final res = await http.get(
      Uri.parse("$baseUrl/api/pets"),
      headers: {"Authorization": "Bearer $token"},
    );

    return jsonDecode(res.body);
  }

  /// 💉 VACCINATION RECORDS
  static Future<List<dynamic>> getVaccinations(String token) async {
    final res = await http.get(
      Uri.parse("$baseUrl/api/vaccinations"),
      headers: {"Authorization": "Bearer $token"},
    );

    return jsonDecode(res.body);
  }

  /// 🏥 HMO PLANS
  static Future<List<dynamic>> getPlans(String token) async {
    final res = await http.get(
      Uri.parse("$baseUrl/api/plans"),
      headers: {"Authorization": "Bearer $token"},
    );

    return jsonDecode(res.body);
  }

  /// 🏥 CREATE PLAN (POST)
  static Future<Map<String, dynamic>> createPlan(
      String token, Map<String, dynamic> data) async {
    final res = await http.post(
      Uri.parse("$baseUrl/api/plans"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: jsonEncode(data),
    );

    return jsonDecode(res.body);
  }

  /// 🏥 VETS
  static Future<List<dynamic>> getVets() async {
    final res = await http.get(Uri.parse("$baseUrl/api/vets"));
    return jsonDecode(res.body);
  }
}