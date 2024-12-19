import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class AddPropertyPage extends StatefulWidget {
  @override
  _AddPropertyPageState createState() => _AddPropertyPageState();
}

class _AddPropertyPageState extends State<AddPropertyPage> {
  final ImagePicker _picker = ImagePicker();
  final List<XFile> _selectedImages = [];
  final PageController _pageController = PageController();
  Timer? _sliderTimer;

  String _propertyName = '';
  String _propertyAddress = '';
  String _propertyPrice = '';
  String _bedroomCount = '';
  String _bathroomCount = '';
  String _squareFootage = '';
  String _floorCount = '';

  @override
  void initState() {
    super.initState();
    _startSliderTimer();
  }

  @override
  void dispose() {
    _sliderTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startSliderTimer() {
    _sliderTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_selectedImages.isNotEmpty) {
        int nextPage = _pageController.page!.toInt() + 1;
        if (nextPage >= _selectedImages.length) {
          nextPage = 0;
        }
        _pageController.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _pickImages(BuildContext context) async {
    final List<XFile>? images = await _picker.pickMultiImage();
    if (images != null) {
      setState(() {
        _selectedImages.addAll(images);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1E2C),
      appBar: AppBar(
        backgroundColor: Color(0xFF1E1E2C),
        elevation: 0,
        title: Text(
          'Add Property',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isDesktop = constraints.maxWidth > 800;
          return SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Flex(
                  direction: isDesktop ? Axis.horizontal : Axis.vertical,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left Column: Property Card
                    Flexible(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF29293D),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Property Image Slider
                            Container(
                              height: 300,
                              child: Stack(
                                children: [
                                  _selectedImages.isNotEmpty
                                      ? PageView.builder(
                                          controller: _pageController,
                                          itemCount: _selectedImages.length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 4.0),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                image: DecorationImage(
                                                  image: FileImage(File(
                                                      _selectedImages[index]
                                                          .path)),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            );
                                          },
                                        )
                                      : Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey[800],
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'No Image',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ),
                                        ),
                                  // Slider Controls
                                  if (_selectedImages.isNotEmpty)
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      bottom: 0,
                                      child: IconButton(
                                        icon: Icon(Icons.arrow_back_ios,
                                            color: Colors.white),
                                        onPressed: () {
                                          int previousPage =
                                              (_pageController.page!.toInt() -
                                                      1) %
                                                  _selectedImages.length;
                                          _pageController.animateToPage(
                                            previousPage,
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.easeInOut,
                                          );
                                        },
                                      ),
                                    ),
                                  if (_selectedImages.isNotEmpty)
                                    Positioned(
                                      right: 0,
                                      top: 0,
                                      bottom: 0,
                                      child: IconButton(
                                        icon: Icon(Icons.arrow_forward_ios,
                                            color: Colors.white),
                                        onPressed: () {
                                          int nextPage =
                                              (_pageController.page!.toInt() +
                                                      1) %
                                                  _selectedImages.length;
                                          _pageController.animateToPage(
                                            nextPage,
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.easeInOut,
                                          );
                                        },
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Text(
                              _propertyName.isEmpty
                                  ? 'Property Name'
                                  : _propertyName,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              _propertyAddress.isEmpty
                                  ? 'Address'
                                  : _propertyAddress,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14.0),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Price: ₦${_propertyPrice.isEmpty ? '0.00' : _propertyPrice}',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14.0),
                            ),
                            SizedBox(height: 16.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InfoChip(
                                    icon: Icons.king_bed,
                                    label:
                                        '${_bedroomCount.isEmpty ? '0' : _bedroomCount} Beds'),
                                InfoChip(
                                    icon: Icons.bathtub,
                                    label:
                                        '${_bathroomCount.isEmpty ? '0' : _bathroomCount} Bath'),
                                InfoChip(
                                    icon: Icons.square_foot,
                                    label:
                                        '${_squareFootage.isEmpty ? '0' : _squareFootage} ft'),
                                InfoChip(
                                    icon: Icons.layers,
                                    label:
                                        '${_floorCount.isEmpty ? '0' : _floorCount} Floor'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                        width: isDesktop ? 16.0 : 0,
                        height: isDesktop ? 0 : 16.0),
                    // Right Column: Form and Image Uploader
                    Flexible(
                      flex: 2,
                      child: Column(
                        children: [
                          // Image Uploader
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF29293D),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            padding: EdgeInsets.all(16.0),
                            child: GestureDetector(
                              onTap: () => _pickImages(context),
                              child: Container(
                                height: 150,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Center(
                                  child: Text(
                                    'Drop your images here, or click to browse\n(1600 x 1200 recommended)',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 16.0),
                          // Property Form
                          PropertyFormField(
                            hintText: 'Name',
                            label: 'Property Name',
                            onChanged: (value) =>
                                setState(() => _propertyName = value),
                          ),
                          PropertyFormField(
                            prefixIcon: Icon(FontAwesomeIcons.locationDot),
                            hintText: 'Address',
                            label: 'Address',
                            onChanged: (value) =>
                                setState(() => _propertyAddress = value),
                          ),
                          PropertyFormField(
                            hintText: 'Price',
                            label: 'Price',
                            prefixIcon: Icon(FontAwesomeIcons.nairaSign,
                                color: Colors.grey),
                            onChanged: (value) =>
                                setState(() => _propertyPrice = value),
                          ),
                          PropertyFormField(
                            hintText: 'Bedrooms',
                            label: 'Bedrooms',
                            onChanged: (value) =>
                                setState(() => _bedroomCount = value),
                          ),
                          PropertyFormField(
                            hintText: 'Bathrooms',
                            label: 'Bathrooms',
                            onChanged: (value) =>
                                setState(() => _bathroomCount = value),
                          ),
                          PropertyFormField(
                            hintText: 'Square Footage',
                            label: 'Square Footage',
                            onChanged: (value) =>
                                setState(() => _squareFootage = value),
                          ),
                          PropertyFormField(
                            hintText: 'Floors',
                            label: 'Floors',
                            onChanged: (value) =>
                                setState(() => _floorCount = value),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;

  InfoChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey, size: 16.0),
        SizedBox(width: 4.0),
        Text(
          label,
          style: TextStyle(color: Colors.grey, fontSize: 12.0),
        ),
      ],
    );
  }
}

class PropertyFormField extends StatelessWidget {
  final String hintText;
  final String label;
  final Icon? prefixIcon;
  final Function(String)? onChanged;

  PropertyFormField(
      {required this.hintText,
      required this.label,
      this.prefixIcon,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        style: TextStyle(color: Colors.white),
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: prefixIcon,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
