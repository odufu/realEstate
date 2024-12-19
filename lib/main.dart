import 'package:flutter/material.dart';
import '/salis/admin/presentation/pages/admin_pannel_page.dart';
import '/salis/auth/presentation/pages/splash_screen.dart';
import '/salis/core/app_constants.dart';
import '/salis/core/theme/salis_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:
          "${AppConstants.companyHeaderName} ${AppConstants.companySubTitleName}",
      theme: AppConstants.companyTheme,
      home: AdminPanelPage(),
    );
  }
}
