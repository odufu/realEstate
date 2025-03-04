import 'package:realestate/salis/admin/auth/presentation/pages/admin_signin_page.dart';

import '../../../../core/utils/helper_functions.dart';
import 'package:flutter/material.dart';

class AdminSplashScreen extends StatefulWidget {
  const AdminSplashScreen();

  @override
  State<AdminSplashScreen> createState() => _AdminSplashScreenState();
}

class _AdminSplashScreenState extends State<AdminSplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      // ignore: use_build_context_synchronously
      HelperFunctions.routeReplacdTo(AdminSignInPage(), context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 100, child: Image.asset("assets/mcdreamslogo.png")),
                //assets/tpupylogo.png
                const SizedBox(
                  height: 60,
                ),
                Text(
                  "MCDREAM",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w100,
                      letterSpacing: 10,
                      color: Theme.of(context).colorScheme.surface),
                ),
                Text(
                  "CONCEPT",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.surface),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text("Wait a second..."),
                const SizedBox(
                  height: 60,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const WelcomePage()));
                  },
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.surface,
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
