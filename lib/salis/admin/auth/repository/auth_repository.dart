import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepository {
  final String baseUrl;

  // Secure storage instance to handle sensitive data like tokens
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  AuthRepository({required this.baseUrl});

  // Save the token securely in the storage
  Future<void> _saveToken(String token) async {
    await _secureStorage.write(key: 'auth_token', value: token);
  }

  // Retrieve the token from secure storage
  Future<String?> _getToken() async {
    return await _secureStorage.read(key: 'auth_token');
  }

  // Delete the token from secure storage (useful for logout)
  Future<void> _deleteToken() async {
    await _secureStorage.delete(key: 'auth_token');
  }

  // Admin signup method
  Future<Map<String, dynamic>> adminSignup(
      String name, String email, String password) async {
    final url = Uri.parse('$baseUrl/auth/adminSignup');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Signup failed: ${response.body}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> adminLogin(String email, String password) async {
    final url = Uri.parse('$baseUrl/auth/adminLogin');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        if (responseBody['success'] == true) {
          // Save token securely
          final token = responseBody['token'];
          if (token != null) {
            await _saveToken(token);
          }

          return {
            'success': true,
            'message': responseBody['message'],
            'data': responseBody['data'],
          };
        } else {
          // Handle failure response
          return {
            'success': false,
            'message': responseBody['message'],
          };
        }
      } else {
        // Handle unexpected status code
        final responseBody = jsonDecode(response.body);

        throw Exception('${responseBody["message"]}: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // Admin OTP verification method
  Future<Map<String, dynamic>> adminVerifyOtp(int otpCode) async {
    final url = Uri.parse('$baseUrl/auth/verify');
    final body = jsonEncode({'otpCode': otpCode});

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: body,
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200 && responseData['success'] == true) {
        // Save token if it exists in the response
        final token = responseData['token'];
        if (token != null) {
          await _saveToken(token);
        }

        return {
          'success': true,
          'message': responseData['message'] ?? '',
          'token': token ?? '',
          'userData': responseData['data']?['user'] ?? {},
        };
      } else {
        return {
          'success': false,
          'error': responseData['error'] ?? 'An error occurred.',
        };
      }
    } catch (e) {
      throw Exception('An implementation error occurred: $e');
    }
  }

  // Example: Making an authenticated request using the stored token
  Future<http.Response> makeAuthenticatedRequest(String endpoint,
      {Map<String, dynamic>? body}) async {
    final token = await _getToken();
    final url = Uri.parse('$baseUrl/$endpoint');

    return await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      },
      body: body != null ? jsonEncode(body) : null,
    );
  }

  // Logout method to clear the token
  Future<void> logout() async {
    await _deleteToken();
  }
}
