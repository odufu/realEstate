import 'package:flutter/material.dart';

class OrderListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212), // Dark background
      appBar: AppBar(
        backgroundColor: Color(0xFF1E1E2E),
        elevation: 0,
        title: Text(
          'All Order List',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.light_mode, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.grid_view, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
          CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white),
          ),
          SizedBox(width: 16),
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
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Color(0xFF1E1E2E),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
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
                  SizedBox(width: 16),
                  DropdownButton<String>(
                    dropdownColor: Color(0xFF1E1E2E),
                    value: 'This Month',
                    onChanged: (value) {},
                    items: [
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
              SizedBox(height: 16),
              // Table
              DataTable(
                headingRowColor: MaterialStateColor.resolveWith(
                    (states) => Color(0xFF1E1E2E)),
                dataRowColor: MaterialStateColor.resolveWith(
                    (states) => Color(0xFF1E1E2E)),
                headingTextStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                dataTextStyle: TextStyle(color: Colors.white70),
                columns: [
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
              SizedBox(width: 8),
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
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        DataCell(
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.visibility, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.edit, color: Colors.blue),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
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
