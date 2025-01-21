import 'package:flutter/material.dart';
import '/salis/admin/presentation/pages/clients/pages/customer_detail_page.dart';
import '/salis/admin/presentation/pages/clients/pages/grid_client_page.dart';

class CustomerListPage extends StatefulWidget {
  const CustomerListPage({super.key});

  @override
  State<CustomerListPage> createState() => _CustomerListPageState();
}

class _CustomerListPageState extends State<CustomerListPage> {
  bool _isGrid = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(_isGrid ? Icons.grid_view : Icons.view_list),
            onPressed: () {
              setState(() {
                _isGrid = !_isGrid;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/profile.png'),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'All Customer List',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                DropdownButton<String>(
                  value: 'This Month',
                  items: ['This Month', 'Last Month', 'This Year']
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
          Expanded(
              child: _isGrid
                  ? ListView.builder(
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return CustomerListItem();
                      },
                    )
                  : const GridClientPage()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Previous',
                  ),
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    '1',
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    '2',
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    '3',
                  ),
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Next',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}

class CustomerListItem extends StatelessWidget {
  const CustomerListItem({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Checkbox(
            value: false,
            onChanged: (value) {},
          ),
          const CircleAvatar(
            backgroundImage: AssetImage('assets/profile.png'),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Michael A. Miner',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  'daavidmunmimen@teleworm.us',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          if (!isMobile)
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '+231 06-75820711',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'Residential',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          IconButton(
            icon: const Icon(Icons.visibility, color: Colors.grey),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CustomerDetailsPage()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.purple),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CustomerDetailsPage()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CustomerDetailsPage()));
            },
          ),
        ],
      ),
    );
  }
}
