import 'dart:async';
import '../../../props/data/co_ownership.dart';
import '../../../props/data/property.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import '../../../core/utils/helper_functions.dart';
import '../../../core/widgets/app_button.dart';
import '../../../props/presentation/widgets/ownership_slot_page.dart';

import '../../../props/presentation/widgets/pool_progress_bar.dart';
import 'instalment_progress.dart';

class MyPropsDetails extends StatefulWidget {
  final Property property;
  const MyPropsDetails({
    required this.property,
  });

  @override
  State<MyPropsDetails> createState() => _MyPropsDetailsState();
}

class _MyPropsDetailsState extends State<MyPropsDetails> {
  late PageController _pageController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    // Auto-slide every 5 seconds
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      int nextPage =
          (_pageController.page!.toInt() + 1) % widget.property.images!.length;
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        title: Text(widget.property.title,
            style: TextStyle(color: Theme.of(context).colorScheme.surface)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Slider with Arrow Controls
            Stack(
              children: [
                SizedBox(
                  height: 200,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: widget.property.images!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(widget.property.images![index]),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 80,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 80,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios,
                        color: Colors.white),
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),

            // Video Player Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    "WALK-THROUGH VIDEO",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const Icon(Icons.video_camera_back_sharp)
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                decoration: const BoxDecoration(
                    border: Border.symmetric(
                        horizontal: BorderSide(
                  color: Colors.black,
                ))),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Chewie(
                    controller: ChewieController(
                      videoPlayerController: VideoPlayerController.asset(
                        widget.property
                            .video!, // Replace with your video asset or network URL
                      ),
                      autoPlay: false,
                      looping: false,
                      allowFullScreen: true,
                      materialProgressColors: ChewieProgressColors(
                        playedColor: Theme.of(context).colorScheme.primary,
                        handleColor: Colors.red,
                        backgroundColor: Colors.grey,
                      ),
                      placeholder: const Center(
                        child: Icon(Icons.play_circle_fill,
                            size: 60, color: Color.fromARGB(255, 54, 4, 4)),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //TITLE
                  Text(
                    widget.property.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  //PROPS TYPE
                  Text(
                    "Landed",
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontStyle: FontStyle.italic,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  // LOCATION
                  Text(
                    widget.property.address,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),

                  // DESCRIOTION
                  const Divider(),
                  Text(
                    widget.property.address,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(),
                  // CONTENTS
                  Text(
                    "Features",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),

                  Column(
                    children: [
                      Row(
                        children: [
                          widget.property.eletricity == true
                              ? const Row(
                                  children: [
                                    Icon(Icons.bolt),
                                    Text("Electricity")
                                  ],
                                )
                              : const SizedBox.shrink(),
                          const SizedBox(
                            width: 50,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.apartment),
                              Text("Bedrooms: ${widget.property.bedrooms}")
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Row(
                            children: [Icon(Icons.security), Text("Security")],
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.bathroom),
                              Text("Bathroom: ${widget.property.bathrooms}")
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Row(
                        children: [
                          Row(
                            children: [Icon(Icons.water), Text("Water")],
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Row(
                            children: [
                              Icon(Icons.width_full),
                              Text("Size: 1200 sq Foot")
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(),
                  // EMENITIES
                  Text(
                    "Amenities",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 1,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.local_parking,
                                size: 15,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                  "Packing Space:${widget.property.packingSpace}")
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.landscape,
                                size: 15,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text("Garden: Comon ${widget.property.garden}")
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.pool,
                                size: 15,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text("Pool: ${widget.property.pool}")
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //P A Y M E N T   P L A N S

                  //INSTALMENT PAYMENT

                  widget.property.installmentPlan != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "INSTALMENT PAYMENT PLAN",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 1,
                                  height: 90,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_month,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          size: 15,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                            "Next Payment: ${widget.property.installmentPlan!.paymentSchedules[0].toString().split(" ")[0]}")
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.paid,
                                          color: Colors.green,
                                          size: 15,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Total Worth: ₦${widget.property.installmentPlan!.totalCost}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.payment,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          size: 15,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Paid: ₦${widget.property.installmentPlan!.amountPaid}",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.normal,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.hourglass_bottom,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          size: 15,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        InstallmentProgress(
                                          total: widget.property
                                              .installmentPlan!.totalCost,
                                          paid: widget.property.installmentPlan!
                                              .amountPaid!,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        )
                      :

                      //CO-OWNERSHIP PAYMENT

                      widget.property.coOwnershipPlan != null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "CO-OWNERSHIP POOLED PAYMENT PLAN",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 1,
                                      height: 90,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.pie_chart,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              size: 15,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                                "My Share: ${widget.property.coOwnershipPlan!.ownershipShares[0]}")
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.paid,
                                              color: Colors.green,
                                              size: 15,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Total Worth: ₦${widget.property.price}",
                                              style: const TextStyle(
                                                  fontWeight:
                                                      FontWeight.normal),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.payment,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              size: 15,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Share Price: ₦${widget.property.coOwnershipPlan!.ownershipShares[0].sharePrice}/Shares",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.normal,
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.hourglass_bottom,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              size: 15,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .7,
                                              child: PoolProgressBar(
                                                  property: widget.property),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                )
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "OUTRIGHT PAYMENT PLAN",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 1,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.paid,
                                              color: Colors.green,
                                              size: 15,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Total Worth: ₦${widget.property.price}",
                                              style: const TextStyle(
                                                  fontWeight:
                                                      FontWeight.normal),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                  //D O C U M E N T A T I O N
                  Text(
                    "WHY SHOULD YOU BUY THIS?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 1,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.verified,
                                size: 15,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Good title Document (Registered Survey)")
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.approval,
                                color: Colors.red,
                                size: 15,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Free from Government")
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.show_chart,
                                color: Colors.red,
                                size: 15,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Fast appreciable value")
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  // SITE MAP
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "SITE MAP",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Image.asset(
                    widget.property.siteMap!,
                  ),
                  // FLOOR PLANS
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "HOUSE PLAN",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Image.asset(widget.property.housePlan!),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)]),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButton(
                text: "Contact Agent",
                width: MediaQuery.of(context).size.width * .4,
                onPress: () {
                  // HelperFunctions.routePushTo(
                  //     OwnershipSlotsPage(
                  //       property: widget.property,
                  //     ),
                  //     context);
                }),
          ],
        ),
      ),
    );
  }
}
