import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import for date formatting

class TransactionsPage extends StatelessWidget {
  const TransactionsPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212), // Dark background
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E2E),
        elevation: 0,
        title: const Text(
          'Transactions',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowColor: WidgetStateColor.resolveWith(
                (states) => const Color(0xFF1E1E2E)),
            dataRowColor: WidgetStateColor.resolveWith(
                (states) => const Color(0xFF1E1E2E)),
            headingTextStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            dataTextStyle: const TextStyle(color: Colors.white70),
            columnSpacing: 20,
            columns: const [
              DataColumn(label: Text('Customer Photo & Name')),
              DataColumn(label: Text('Date')),
              DataColumn(label: Text('Amount')),
              DataColumn(label: Text('Payment Method')),
              DataColumn(label: Text('Agent Name')),
              DataColumn(label: Text('Invested Property')),
              DataColumn(label: Text('Status')),
              DataColumn(label: Text('Action')),
            ],
            rows: _buildTransactionRows(context),
          ),
        ),
      ),
    );
  }

  List<DataRow> _buildTransactionRows(BuildContext context) {
    // Sample Data
    final List<Map<String, dynamic>> transactions = [
      {
        'id': '1',
        'photo': 'https://via.placeholder.com/40',
        'name': 'Michael A. Miner',
        'date': '2024-10-24',
        'amount': 45842,
        'paymentMethod': 'Mastercard **** 3467',
        'agentName': 'Michael A. Miner',
        'property': 'W. straat 102 DK Deventer',
        'status': 'Completed',
      },
      {
        'id': '2',
        'photo': 'https://via.placeholder.com/40',
        'name': 'Theresa T. Brose',
        'date': '2024-10-24',
        'amount': 78483,
        'paymentMethod': 'Visa card **** 4722',
        'agentName': 'Theresa T. Brose',
        'property': 'Isaac Tirionplein 100',
        'status': 'Cancel',
      },
      {
        'id': '3',
        'photo': 'https://via.placeholder.com/40',
        'name': 'James L. Erickson',
        'date': '2024-10-24',
        'amount': 83644,
        'paymentMethod': 'Mastercard **** 7263',
        'agentName': 'Walter L. Caleb',
        'property': '123 Maple St, 456 Oak Ave',
        'status': 'Completed',
      },
    ];

    // Generate Rows Dynamically
    return transactions.map((transaction) {
      return DataRow(
        cells: [
          DataCell(
            Row(
              children: [
                CircleAvatar(
                  backgroundImage:
                      NetworkImage(transaction['photo']!.toString()),
                ),
                const SizedBox(width: 8),
                Text(transaction['name']!.toString()),
              ],
            ),
          ),
          DataCell(Text(transaction['date']!.toString())),
          DataCell(Text(transaction['amount']!.toString())),
          DataCell(Text(transaction['paymentMethod']!.toString())),
          DataCell(Text(transaction['agentName']!.toString())),
          DataCell(Text(transaction['property']!.toString())),
          DataCell(
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: _getStatusColor(transaction['status']!.toString()),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                transaction['status']!.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          DataCell(
            IconButton(
              icon: const Icon(Icons.visibility, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        TransactionDetailsPage(transaction: transaction),
                  ),
                );
              },
            ),
          ),
        ],
      );
    }).toList();
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Completed':
        return Colors.green;
      case 'Cancel':
        return Colors.red;
      case 'Pending':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
}

class TransactionDetailsPage extends StatelessWidget {
  final Map<String, dynamic> transaction;

  const TransactionDetailsPage({required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Transaction ID: ${transaction['transactionId']}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Text('Property Name: ${transaction['propertyName']}'),
            const SizedBox(height: 8.0),
            Text('Buyer Name: ${transaction['buyerName']}'),
            const SizedBox(height: 8.0),
            Text('Seller Name: ${transaction['sellerName']}'),
            const SizedBox(height: 8.0),
            Text(
              'Amount: ₦${transaction['amount'].toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Date: ${DateFormat('yyyy-MM-dd').format(
                DateTime.parse(transaction['date']),
              )}',
            ),
            const SizedBox(height: 16.0),
            const Text('Payment Details:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            // Display payment details (if available)
            if (transaction['paymentMethod'] != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Payment Method: ${transaction['paymentMethod']}'),
                  if (transaction['paymentReference'] != null)
                    Text('Reference ID: ${transaction['paymentReference']}'),
                  if (transaction['paymentStatus'] != null)
                    Text('Status: ${transaction['paymentStatus']}'),
                ],
              ),
            // Add more details as needed (e.g., commission, fees)
          ],
        ),
      ),
    );
  }
}
