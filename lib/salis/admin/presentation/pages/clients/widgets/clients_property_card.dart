import 'package:flutter/material.dart';

class ClientsPropertyCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String footerTitle;
  final String footerValue;
  final double progressValue;
  final Color progressColor;

  ClientsPropertyCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.footerTitle,
    required this.footerValue,
    required this.progressValue,
    required this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF1E1E2E), // Dark card background
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: iconColor.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: iconColor,
                    size: 24,
                  ),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  footerTitle,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                Text(
                  footerValue,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: progressValue,
                color: progressColor,
                backgroundColor: Colors.white10,
                minHeight: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClientsPropertyCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212), // App background color
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ClientsPropertyCard(
                icon: Icons.home,
                iconColor: Colors.green,
                title: "Active Property",
                subtitle: "350 Property Active",
                footerTitle: "View Property",
                footerValue: "231",
                progressValue: 0.6,
                progressColor: Colors.green,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: ClientsPropertyCard(
                icon: Icons.house_siding,
                iconColor: Colors.orange,
                title: "View Property",
                subtitle: "231 Property View",
                footerTitle: "View Property",
                footerValue: "27",
                progressValue: 0.4,
                progressColor: Colors.orange,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: ClientsPropertyCard(
                icon: Icons.attach_money,
                iconColor: Colors.purple,
                title: "Own Property",
                subtitle: "27 Property Own",
                footerTitle: "View Property",
                footerValue: "₦928,128",
                progressValue: 0.8,
                progressColor: Colors.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ClientsPropertyCardWidget(),
  ));
}
