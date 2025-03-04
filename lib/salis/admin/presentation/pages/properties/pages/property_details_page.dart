import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PropertyDetailsPage extends StatelessWidget {
  const PropertyDetailsPage();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 231, 231, 231), // Dark theme background
      appBar: AppBar(
        backgroundColor: const Color(0xFF23253A),
        title: const Text('Property Overview'),
        actions: [
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
          const CircleAvatar(backgroundImage: AssetImage('assets/profile.png')),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              !isMobile
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left Panel: Property Owner and Schedule a Tour
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              PropertyOwnerCard(),
                              const SizedBox(height: 16),
                              ScheduleTourForm(),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Right Panel: Property Details
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PropertyImageCard(),
                              const SizedBox(height: 16),
                              PropertyDetails(),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left Panel: Property Owner and Schedule a Tour
                        Column(
                          children: [
                            PropertyOwnerCard(),
                            const SizedBox(height: 16),
                            ScheduleTourForm(),
                          ],
                        ),
                        const SizedBox(width: 16),
                        // Right Panel: Property Details
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PropertyImageCard(),
                            const SizedBox(height: 16),
                            PropertyDetails(),
                          ],
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class PropertyOwnerCard extends StatelessWidget {
  const PropertyOwnerCard();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 1200;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/profile.png'),
          ),
          const SizedBox(height: 8),
          const Text(
            'Gaston Lapierre',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const Text(
            '(Owner)',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.facebook, color: Colors.blue),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.camera_alt, color: Colors.pink),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.share, color: Colors.lightBlue),
                onPressed: () {},
              ),
              IconButton(
                icon:
                    const Icon(FontAwesomeIcons.whatsapp, color: Colors.green),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 16),
          !isMobile
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      icon: const Icon(Icons.call),
                      label: const Text('Call Us'),
                      onPressed: () {},
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      icon: const Icon(Icons.message),
                      label: const Text('Message'),
                      onPressed: () {},
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      icon: const Icon(Icons.call),
                      label: const Text('Call Us'),
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      icon: const Icon(Icons.message),
                      label: const Text('Message'),
                      onPressed: () {},
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}

// Schedule a Tour Form
class ScheduleTourForm extends StatelessWidget {
  const ScheduleTourForm();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Schedule A Tour',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              hintText: 'dd-mm-yyyy',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              hintText: '12:00 PM',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              hintText: 'Your Full Name',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}

// Property Image Card
class PropertyImageCard extends StatelessWidget {
  const PropertyImageCard();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: const DecorationImage(
              image: AssetImage('assets/images/props4.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 16,
          left: 16,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(8),
            ),
            child:
                const Text('For Sale', style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}

class PropertyDetails extends StatelessWidget {
  const PropertyDetails();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          const Text(
            'Hayfield Ashton Place Residences at Willow Brook Valley',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),

          // Address
          const Row(
            children: [
              Icon(Icons.location_on, color: Colors.purple, size: 16),
              SizedBox(width: 4),
              Text(
                '1668 Lincoln Drive Harrisburg, PA 17101 U.S.A',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Price and Details

          const Text(
            '₦80,675.00',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(10)),
            child: Wrap(
              children: [
                _buildIconText(Icons.bed, '5 Bedroom', context),
                const SizedBox(width: 8),
                _buildIconText(Icons.bathtub, '4 Bathrooms', context),
                const SizedBox(width: 8),
                _buildIconText(Icons.square_foot, '1800sqft', context),
                _buildIconText(Icons.bed, '5 Bedroom', context),
                const SizedBox(width: 8),
                _buildIconText(Icons.bathtub, '4 Bathrooms', context),
                const SizedBox(width: 8),
                _buildIconText(Icons.square_foot, '1800sqft', context),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Facilities
          const Text(
            'Some Facility :',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              _buildFacilityChip('Big Swimming Pool', context),
              _buildFacilityChip('Near Airport', context),
              _buildFacilityChip('Big Size Garden', context),
              _buildFacilityChip('4 Car Parking', context),
              _buildFacilityChip('24/7 Electricity', context),
              _buildFacilityChip('Personal Theater', context),
            ],
          ),
          const SizedBox(height: 16),

          // Property Details
          const Text(
            'Property Details :',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Property refers to any item that an individual or a business holds legal title to. This can include tangible items, such as houses, cars, or appliances, as well as intangible items that hold potential future value, such as stock and bond certificates. Legally, property is classified into two categories: personal property and real property.',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 16),

          // Date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'View More Detail ->',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                    fontSize: 14),
              ),
              const Text(
                '10 May 2024',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIconText(IconData icon, String text, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, size: 16),
          Text(
            text,
            style: const TextStyle(fontSize: 12),
          ),
          Container(
            height: 10,
            width: 1,
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.primary),
          )
        ],
      ),
    );
  }

  Widget _buildFacilityChip(String label, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Theme.of(context).colorScheme.primary)),
      child: Text(
        label,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }
}
