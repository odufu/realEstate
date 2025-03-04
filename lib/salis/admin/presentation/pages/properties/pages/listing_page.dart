import 'package:flutter/material.dart';

import '../widgets/table.dart';

class ListingPage extends StatelessWidget {
  const ListingPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Real Estate > Listing List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 16.0,
              runSpacing: 16.0,
              children: [
                _buildStatsCard(
                  title: 'Total Incomes',
                  value: '₦12,7812.09',
                  change: '+34.4%',
                  icon: Icons.account_balance_wallet,
                  color: Colors.green,
                ),
                _buildStatsCard(
                  title: 'Total Properties',
                  value: '15,780 Unit',
                  change: '-8.5%',
                  icon: Icons.home_work,
                  color: Colors.red,
                ),
                _buildStatsCard(
                  title: 'Unit Sold',
                  value: '893 Unit',
                  change: '+17%',
                  icon: Icons.sell,
                  color: Colors.green,
                ),
                _buildStatsCard(
                  title: 'Unit Pending',
                  value: '459 Unit',
                  change: '-12%',
                  icon: Icons.padding,
                  color: Colors.red,
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text(
              'All Properties List',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              // child: SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: DataTable(
              //     columns: const [
              //       DataColumn(label: Text('Properties Photo & Name')),
              //       DataColumn(label: Text('Size')),
              //       DataColumn(label: Text('Property Type')),
              //       DataColumn(label: Text('Pending/Sale')),
              //       DataColumn(label: Text('Bedrooms')),
              //       DataColumn(label: Text('Location')),
              //       DataColumn(label: Text('Price')),
              //       DataColumn(label: Text('Action')),
              //     ],
              //     rows: [
              //       _buildPropertyRow(
              //         photo: 'assets/images/property1.jpg',
              //         name: 'Dvilla Residences Batu',
              //         size: '1400ft',
              //         type: 'Residences',
              //         PendingSale: 'Pending',
              //         bedrooms: '5',
              //         location: 'France',
              //         price: '₦8,930.00',
              //       ),
              //       _buildPropertyRow(
              //         photo: 'assets/images/property2.jpg',
              //         name: 'PIK Villa House',
              //         size: '1700ft',
              //         type: 'Residences',
              //         PendingSale: 'Sold',
              //         bedrooms: '6',
              //         location: 'Bermuda',
              //         price: '₦60,691.00',
              //       ),
              //       _buildPropertyRow(
              //         photo: 'assets/images/property3.jpg',
              //         name: 'Tungis Luxury',
              //         size: '1200ft',
              //         type: 'Residences',
              //         PendingSale: 'Sale',
              //         bedrooms: '4',
              //         location: 'Australia',
              //         price: '₦70,245.00',
              //       ),
              //     ],
              //   ),
              // ),
              child: ListingTablePage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsCard({
    required String title,
    required String value,
    required String change,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color),
              const Spacer(),
              Text(
                change,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(value, style: const TextStyle(fontSize: 14.0)),
        ],
      ),
    );
  }

  DataRow _buildPropertyRow({
    required String photo,
    required String name,
    required String size,
    required String type,
    required String PendingSale,
    required String bedrooms,
    required String location,
    required String price,
  }) {
    return DataRow(cells: [
      DataCell(Row(
        children: [
          Image.asset(photo, width: 40, height: 40, fit: BoxFit.cover),
          const SizedBox(width: 8.0),
          Text(name),
        ],
      )),
      DataCell(Text(size)),
      DataCell(Text(type)),
      DataCell(Text(PendingSale)),
      DataCell(Text(bedrooms)),
      DataCell(Text(location)),
      DataCell(Text(price)),
      DataCell(Row(
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.visibility)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
        ],
      )),
    ]);
  }
}
