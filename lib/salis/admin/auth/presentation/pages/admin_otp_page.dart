import 'package:flutter/material.dart';
import 'package:realestate/salis/admin/presentation/pages/admin_pannel_page.dart';
import 'package:realestate/salis/admin/presentation/pages/dashboard/admin_dashboard.dart';
import '../../repository/auth_repository.dart';
import 'admin_signin_page.dart';

class AdminOtpPage extends StatefulWidget {
  @override
  _AdminOtpPageState createState() => _AdminOtpPageState();
}

class _AdminOtpPageState extends State<AdminOtpPage> {
  final TextEditingController _otpController = TextEditingController();

  final AuthRepository _authRepository = AuthRepository(
      baseUrl: 'http://localhost:3000/api/v1'); // Initialize your repository

  bool _isLoading = false;
  void _handleOtpVerification() async {
    final otpCode = _otpController.text.trim();

    if (otpCode.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("All fields are required")),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await _authRepository.adminVerifyOtp(int.parse(otpCode));

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response['message'] ?? response['error'] ?? '')),
      );

      if (response['success'] == true) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AdminPanelPage()),
        );
      }
    } catch (e) {
      // Display implementation error for debugging purposes
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An implementation error occurred: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1B1F4F), Color(0xFF3A1C71)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Container(
            width: 400,
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E2C),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // UI code remains the same...
                TextField(
                  controller: _otpController,
                  decoration: InputDecoration(
                    labelText: 'OTP Code',
                    labelStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: const Color(0xFF2E2E3E),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _handleOtpVerification,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: _isLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            'Verify',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
