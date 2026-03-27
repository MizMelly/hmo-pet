import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Use your Vercel proxy
  static const String baseUrl = "https://hmo-pet.vercel.app/api";

  // REGISTER
  static Future<Map<String, dynamic>> register(
      String email, String password, String fullname) async {
    final url = Uri.parse('$baseUrl/register'); // ✅ add /register
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'email': email,
        'password': password,
        'fullname': fullname,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to register: ${response.body}');
    }
  }

  // LOGIN
  static Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/login'); // ✅ add /login
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to login: ${response.body}');
    }
  }
}