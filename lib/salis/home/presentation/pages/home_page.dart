import '../../../core/utils/helper_functions.dart';
import '../../../home_page/presentation/home_page.dart';
import '../../../myprops/presentation/my_props.dart';
import '../../../profile/presentation/profile.dart';
import '../../../props/presentation/property.dart';
import 'package:flutter/material.dart';

import '../../../notification/presentation/pages/notification_drawer.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  int? initialIndex;

  HomePage({
    this.initialIndex,
  });
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int selectedIndex = 0;

  final pages = [
    MyHomePage(),
    const Property(),
    const MyProps(),
    Profile(),
  ];

  @override
  void initState() {
    selectedIndex = widget.initialIndex ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.primary, // Dark maroon background
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                HelperFunctions.routePushTo(
                    HomePage(
                      initialIndex: 3,
                    ),
                    context);
              },
              child: const CircleAvatar(
                backgroundImage:
                    AssetImage('assets/profile.png'), // Profile image
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome!',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.surface,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Joel Odufu',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.surface,
                    fontWeight: FontWeight.w100,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Theme.of(context).colorScheme.surface,
            ),
            child: Builder(
              builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: Icon(
                  Icons.notification_add_sharp,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: pages[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        currentIndex: selectedIndex,
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Theme.of(context).colorScheme.tertiary,
        unselectedItemColor: Colors.white70,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            backgroundColor: Theme.of(context).colorScheme.primary,
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.apartment),
            backgroundColor: Theme.of(context).colorScheme.primary,
            label: 'Props',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite),
            backgroundColor: Theme.of(context).colorScheme.primary,
            label: 'My Props',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            backgroundColor: Theme.of(context).colorScheme.primary,
            label: 'Profile',
          ),
        ],
      ),
      endDrawer: NotificationDrawer(scaffoldKey: _scaffoldKey),
    );
  }
}
