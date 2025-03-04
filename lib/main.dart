import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:realestate/salis/admin/auth/presentation/pages/admin_splash_screen.dart';
import 'package:realestate/salis/admin/presentation/pages/dashboard/admin_dashboard.dart';
import 'package:realestate/salis/auth/presentation/pages/welcome_page.dart';
import '/salis/admin/presentation/pages/admin_pannel_page.dart';
import '/salis/auth/presentation/pages/splash_screen.dart';
import '/salis/core/app_constants.dart';
import '/salis/core/theme/salis_mode.dart';

// void main() {
//   runApp(const MyApp());
// }

//TEST MAIN
void main() {
  runApp(
    DevicePreview(builder: (context) => MyApp()), // Wrap your app
  );
}

class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title:
          "${AppConstants.companyHeaderName} ${AppConstants.companySubTitleName}",
      theme: AppConstants.companyTheme,
      home: const SplashScreen(),
    );
  }
}

// ADMIN PANNEL

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:realestate/pannel/main.dart';
// import 'package:realestate/salis/auth/presentation/pages/splash_screen.dart';

// import 'pannel/constants.dart';
// import 'pannel/controllers/menu_app_controller.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Admin Panel',
//       // theme: ThemeData.dark().copyWith(
//       //   scaffoldBackgroundColor: bgColor,
//       //   textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
//       //       .apply(bodyColor: Colors.white),
//       //   canvasColor: secondaryColor,
//       // ),
//       home: MultiProvider(
//         providers: [
//           ChangeNotifierProvider(
//             create: (context) => MenuAppController(),
//           ),
//         ],
//         // child: MyAdminPannel(),
//         child: SplashScreen(),
//       ),
//     );
//   }
// }
