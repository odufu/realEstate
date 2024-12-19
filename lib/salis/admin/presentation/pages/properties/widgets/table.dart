import 'package:flutter/material.dart';
import '../../../../../admin/presentation/pages/admin_pannel_page.dart';
import '../../../../../core/utils/helper_functions.dart';

import '../pages/property_details_page.dart';
import 'stats_card_widget.dart';

class ListingTablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Real Estate > Listing List"),
        backgroundColor: const Color(0xFF1E1E2F),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Stats Panel
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: StatsCards(),
            ),
            // Expandable DataTable
            Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    width: 1035,
                    child: DataTable(
                      dataRowHeight: 80,
                      headingRowColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 255, 255, 255)),
                      dataRowColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 255, 255, 255)),
                      columnSpacing: 20,
                      columns: [
                        DataColumn(
                            label: Text("Properties Photo & Name",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary))),
                        DataColumn(
                            label: Text("Size",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary))),
                        DataColumn(
                            label: Text("Property Type",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary))),
                        DataColumn(
                            label: Text("Pending/Sale",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary))),
                        DataColumn(
                            label: Text("Bedrooms",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary))),
                        DataColumn(
                            label: Text("Location",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary))),
                        DataColumn(
                            label: Text("Price",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary))),
                        DataColumn(
                            label: Text("Action",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary))),
                      ],
                      rows: [
                        _buildRow(
                          context,
                          image: "assets/images/props1.jpg",
                          name: "Dvilla Residences Batu",
                          size: "1400ft",
                          type: "Residences",
                          status: "Pending",
                          bedrooms: "5",
                          location: "France",
                          price: "₦8,930.00",
                        ),
                        _buildRow(
                          context,
                          image: "assets/images/props2.jpg",
                          name: "PIK Villa House",
                          size: "1700ft",
                          type: "Residences",
                          status: "Sold",
                          bedrooms: "6",
                          location: "Bermuda",
                          price: "₦60,691.00",
                        ),
                        _buildRow(
                          context,
                          image: "assets/images/props3.jpg",
                          name: "Tungis Luxury",
                          size: "1200ft",
                          type: "Residences",
                          status: "Sale",
                          bedrooms: "4",
                          location: "Australia",
                          price: "₦70,245.00",
                        ),
                        _buildRow(
                          context,
                          image: "assets/images/props1.jpg",
                          name: "Dvilla Residences Batu",
                          size: "1400ft",
                          type: "Residences",
                          status: "Pending",
                          bedrooms: "5",
                          location: "France",
                          price: "₦8,930.00",
                        ),
                        _buildRow(
                          context,
                          image: "assets/images/props2.jpg",
                          name: "PIK Villa House",
                          size: "1700ft",
                          type: "Residences",
                          status: "Sold",
                          bedrooms: "6",
                          location: "Bermuda",
                          price: "₦60,691.00",
                        ),
                        _buildRow(
                          context,
                          image: "assets/images/props3.jpg",
                          name: "Tungis Luxury",
                          size: "1200ft",
                          type: "Residences",
                          status: "Sale",
                          bedrooms: "4",
                          location: "Australia",
                          price: "₦70,245.00",
                        ),
                        _buildRow(
                          context,
                          image: "assets/images/props1.jpg",
                          name: "Dvilla Residences Batu",
                          size: "1400ft",
                          type: "Residences",
                          status: "Pending",
                          bedrooms: "5",
                          location: "France",
                          price: "₦8,930.00",
                        ),
                        _buildRow(
                          context,
                          image: "assets/images/props2.jpg",
                          name: "PIK Villa House",
                          size: "1700ft",
                          type: "Residences",
                          status: "Sold",
                          bedrooms: "6",
                          location: "Bermuda",
                          price: "₦60,691.00",
                        ),
                        _buildRow(
                          context,
                          image: "assets/images/props3.jpg",
                          name: "Tungis Luxury",
                          size: "1200ft",
                          type: "Residences",
                          status: "Sale",
                          bedrooms: "4",
                          location: "Australia",
                          price: "₦70,245.00",
                        ),
                        _buildRow(
                          context,
                          image: "assets/images/props1.jpg",
                          name: "Dvilla Residences Batu",
                          size: "1400ft",
                          type: "Residences",
                          status: "Pending",
                          bedrooms: "5",
                          location: "France",
                          price: "₦8,930.00",
                        ),
                        _buildRow(
                          context,
                          image: "assets/images/props2.jpg",
                          name: "PIK Villa House",
                          size: "1700ft",
                          type: "Residences",
                          status: "Sold",
                          bedrooms: "6",
                          location: "Bermuda",
                          price: "₦60,691.00",
                        ),
                        _buildRow(
                          context,
                          image: "assets/images/props3.jpg",
                          name: "Tungis Luxury",
                          size: "1200ft",
                          type: "Residences",
                          status: "Sale",
                          bedrooms: "4",
                          location: "Australia",
                          price: "₦70,245.00",
                        ),
                        _buildRow(
                          context,
                          image: "assets/images/props1.jpg",
                          name: "Dvilla Residences Batu",
                          size: "1400ft",
                          type: "Residences",
                          status: "Pending",
                          bedrooms: "5",
                          location: "France",
                          price: "₦8,930.00",
                        ),
                        _buildRow(
                          context,
                          image: "assets/images/props2.jpg",
                          name: "PIK Villa House",
                          size: "1700ft",
                          type: "Residences",
                          status: "Sold",
                          bedrooms: "6",
                          location: "Bermuda",
                          price: "₦60,691.00",
                        ),
                        _buildRow(
                          context,
                          image: "assets/images/props3.jpg",
                          name: "Tungis Luxury",
                          size: "1200ft",
                          type: "Residences",
                          status: "Sale",
                          bedrooms: "4",
                          location: "Australia",
                          price: "₦70,245.00",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required String change,
    required Color changeColor,
    required String description,
    required BuildContext context,
  }) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border:
            Border.all(width: .5, color: Theme.of(context).colorScheme.primary),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.tertiary.withOpacity(.3),
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(icon,
                    color: Theme.of(context).colorScheme.tertiary, size: 40),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    change,
                    style: TextStyle(
                      color: changeColor,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    description,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    "See Details",
                    style: TextStyle(color: Colors.blueAccent, fontSize: 12),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    size: 15,
                    color: Theme.of(context).colorScheme.tertiary,
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  DataRow _buildRow(
    BuildContext context, {
    required String image,
    required String name,
    required String size,
    required String type,
    required String status,
    required String bedrooms,
    required String location,
    required String price,
  }) {
    return DataRow(
      cells: [
        DataCell(Row(
          children: [
            Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child: Image.asset(image,
                    width: 50, height: 50, fit: BoxFit.cover)),
            const SizedBox(width: 10),
            Text(name,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                )),
          ],
        )),
        DataCell(Text(size,
            style: TextStyle(color: Theme.of(context).colorScheme.primary))),
        DataCell(Text(type,
            style: TextStyle(color: Theme.of(context).colorScheme.primary))),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: status == "Pending"
                  ? Colors.green
                  : status == "Sold"
                      ? Colors.red
                      : Colors.orange,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              status,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ),
        DataCell(Text(bedrooms,
            style: TextStyle(color: Theme.of(context).colorScheme.primary))),
        DataCell(Text(location,
            style: TextStyle(color: Theme.of(context).colorScheme.primary))),
        DataCell(Text(price,
            style: TextStyle(color: Theme.of(context).colorScheme.primary))),
        DataCell(Row(
          children: [
            IconButton(
              onPressed: () {
                HelperFunctions.routePushTo(
                    AdminPanelPage(
                      entryPage: PropertyDetailsPage(),
                    ),
                    context);
              },
              icon: const Icon(Icons.visibility, color: Colors.blue),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit, color: Colors.purple),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete, color: Colors.red),
            ),
          ],
        )),
      ],
    );
  }
}
