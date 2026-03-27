// lib/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Base URL now includes /api
  static const String baseUrl = "https://simba-39la.onrender.com/api";

  // ====================== AUTH ======================
  static Future<Map<String, dynamic>> register({
    required String fullname,
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$baseUrl/users/register');

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'fullname': fullname,
        'email': email,
        'password': password,
      }),
    );

    return _handleResponse(response, "Registration failed");
  }

  static Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$baseUrl/users/signin');

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    return _handleResponse(response, "Login failed");
  }

  // ====================== PROTECTED ROUTES ======================
  static Future<Map<String, dynamic>> getProfile(String token) async {
    final response = await http.get(
      Uri.parse("$baseUrl/users/profile"),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );
    return _handleResponse(response, "Failed to load profile");
  }

  static Future<List<dynamic>> getPets(String token) async {
    final response = await http.get(
      Uri.parse("$baseUrl/pets"),
      headers: {"Authorization": "Bearer $token"},
    );
    final data = _handleResponse(response, "Failed to load pets");
    return data is List ? data : [];
  }

  static Future<List<dynamic>> getVaccinations(String token) async {
    final response = await http.get(
      Uri.parse("$baseUrl/users/vaccinations"),
      headers: {"Authorization": "Bearer $token"},
    );
    final data = _handleResponse(response, "Failed to load vaccinations");
    return data is List ? data : [];
  }

  static Future<List<dynamic>> getPlans(String token) async {
    final response = await http.get(
      Uri.parse("$baseUrl/users/plans"),
      headers: {"Authorization": "Bearer $token"},
    );
    final data = _handleResponse(response, "Failed to load plans");
    return data is List ? data : [];
  }

  static Future<List<dynamic>> getVets() async {
    final response = await http.get(Uri.parse("$baseUrl/vets"));
    final data = _handleResponse(response, "Failed to load vets");
    return data is List ? data : [];
  }

  // ====================== HELPER ======================
  static dynamic _handleResponse(http.Response response, String defaultError) {
    final body = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return body;
    } else {
      throw Exception(body['message'] ?? body['error'] ?? defaultError);
    }
  }
}