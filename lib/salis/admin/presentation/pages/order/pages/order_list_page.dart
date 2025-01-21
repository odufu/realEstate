import 'package:flutter/material.dart';

class OrderListPage extends StatelessWidget {
  const OrderListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212), // Dark background
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E2E),
        elevation: 0,
        title: const Text(
          'All Order List',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.light_mode, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.grid_view, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
          const CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Search and Filter Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E1E2E),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search...',
                          hintStyle: TextStyle(color: Colors.white70),
                          icon: Icon(Icons.search, color: Colors.white70),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  DropdownButton<String>(
                    dropdownColor: const Color(0xFF1E1E2E),
                    value: 'This Month',
                    onChanged: (value) {},
                    items: const [
                      DropdownMenuItem(
                        value: 'This Month',
                        child: Text(
                          'This Month',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'Last Month',
                        child: Text(
                          'Last Month',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Table
              DataTable(
                headingRowColor: WidgetStateColor.resolveWith(
                    (states) => const Color(0xFF1E1E2E)),
                dataRowColor: WidgetStateColor.resolveWith(
                    (states) => const Color(0xFF1E1E2E)),
                headingTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                dataTextStyle: const TextStyle(color: Colors.white70),
                columns: const [
                  DataColumn(label: Text('Photo & Name')),
                  DataColumn(label: Text('Purchase Date')),
                  DataColumn(label: Text('Contact')),
                  DataColumn(label: Text('Property Type')),
                  DataColumn(label: Text('Amount')),
                  DataColumn(label: Text(' Status')),
                  DataColumn(label: Text('Action')),
                ],
                rows: [
                  _buildDataRow(
                    context,
                    photoUrl: 'https://via.placeholder.com/40',
                    name: 'Michael A. Miner',
                    date: '10/24/2024',
                    contact: '+231 06-75820711',
                    propertyType: 'Residences',
                    amount: '₦45,842',
                    status: 'Paid',
                  ),
                  _buildDataRow(
                    context,
                    photoUrl: 'https://via.placeholder.com/40',
                    name: 'Theresa T. Brose',
                    date: '07/16/2024',
                    contact: '+231 47-23456789',
                    propertyType: 'Villas',
                    amount: '₦78,483',
                    status: 'Paid',
                  ),
                  // Add more rows here...
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  DataRow _buildDataRow(
    BuildContext context, {
    required String photoUrl,
    required String name,
    required String date,
    required String contact,
    required String propertyType,
    required String amount,
    required String status,
  }) {
    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(photoUrl),
              ),
              const SizedBox(width: 8),
              Text(name),
            ],
          ),
        ),
        DataCell(Text(date)),
        DataCell(Text(contact)),
        DataCell(Text(propertyType)),
        DataCell(Text(amount)),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: status == 'Paid'
                  ? Colors.green
                  : status == 'Unpaid'
                      ? Colors.red
                      : Colors.orange,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              status,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        DataCell(
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.visibility, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.blue),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OrderListPage(),
    ));
