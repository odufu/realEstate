import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../core/utils/helper_functions.dart';
import '../../../../../props/data/property.dart';
import '../../admin_pannel_page.dart';
import '../pages/property_details_page.dart';

class PropertyCard extends StatefulWidget {
  final Property property;

  const PropertyCard({
    required this.property,
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _PropertyCardState createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  final PageController _pageController = PageController();
  Timer? _autoSlideTimer;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  @override
  void dispose() {
    _autoSlideTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoSlide() {
    _autoSlideTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_pageController.hasClients) {
        final nextPage = (_pageController.page?.toInt() ?? 0) + 1;
        _pageController.animateToPage(
          nextPage %
              widget.property.images!.length, // Wrap around to the first image
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: SizedBox(
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              SizedBox(
                height: 150,
                child: Stack(
                  children: [
                    PageView.builder(
                      controller: _pageController,
                      itemCount: widget.property.images!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(widget.property.images![index]),
                            ),
                          ),
                        );
                      },
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      bottom: 0,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_left, size: 30),
                        onPressed: () {
                          if (_pageController.hasClients) {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_right, size: 30),
                        onPressed: () {
                          if (_pageController.hasClients) {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.5),
                        borderRadius: BorderRadius.circular(5)),
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.white,
                    )),
              ),
              Positioned(
                right: 0,
                child: IconButton(
                  onPressed: () {},
                  icon: Container(
                      width: 50,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.green.withOpacity(.5),
                          borderRadius: BorderRadius.circular(5)),
                      child: const Text(
                        textAlign: TextAlign.center,
                        "Sale",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Icon(
                            Icons.apartment,
                            color: Theme.of(context).colorScheme.primary,
                          )),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              widget.property.title,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.property.title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Wrap(
                    spacing: 20,
                    runSpacing: 5,
                    children: [
                      FeatureWidget(
                        icon: Icons.bed,
                        title: "Bed",
                        value: "5",
                      ),
                      FeatureWidget(
                        icon: Icons.bathroom,
                        title: "Bath",
                        value: "4",
                      ),
                      FeatureWidget(
                        icon: Icons.scale,
                        title: "Ft",
                        value: "400",
                      ),
                      FeatureWidget(
                        icon: Icons.flag,
                        title: "Bed",
                        value: "5",
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Divider(
              thickness: .5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Row(
                    children: [
                      Text(
                        "N ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "2055505546",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                HelperFunctions.routePushTo(
                                    AdminPanelPage(
                                      entryPage: PropertyDetailsPage(),
                                    ),
                                    context);
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "More Enquiries",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    size: 15,
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                  )
                                ],
                              )),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  const FeatureWidget(
      {required this.icon,
      required this.title,
      required this.value,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 30,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
              color: Theme.of(context).colorScheme.primary, width: .5)),
      child: Row(
        children: [
          Icon(
            icon,
            size: 15,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            textAlign: TextAlign.start,
            value,
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 14),
          )
        ],
      ),
    );
  }
}
