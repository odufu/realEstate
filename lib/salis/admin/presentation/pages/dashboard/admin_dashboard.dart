import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to the Admin Panel',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                AdminFeatureCard(
                  title: 'Total Users',
                  value: '120',
                  icon: Icons.people,
                  color: Colors.blue,
                ),
                AdminFeatureCard(
                  title: 'Total Properties',
                  value: '45',
                  icon: Icons.home,
                  color: Colors.green,
                ),
                AdminFeatureCard(
                  title: 'Installments',
                  value: '45',
                  icon: Icons.paid,
                  color: Colors.green,
                ),
                AdminFeatureCard(
                  title: 'Co-Ownerships',
                  value: '45',
                  icon: Icons.donut_large,
                  color: Colors.green,
                ),
                AdminFeatureCard(
                  title: 'Transaction',
                  value: '45',
                  icon: Icons.home,
                  color: Colors.green,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AdminFeatureCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const AdminFeatureCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.width < 800 ? 1 : 3) -
          32,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 40, color: color),
          const SizedBox(height: 10),
          Text(title,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Text(value,
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }
}
