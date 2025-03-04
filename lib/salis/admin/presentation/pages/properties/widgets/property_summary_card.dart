import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 100,
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
    );
  }
}

class IncomeWidget extends StatelessWidget {
  final double totalIncome;
  final double percentageChange;
  final String title;
  final IconData icon;

  const IncomeWidget({
    required this.totalIncome,
    required this.percentageChange,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(.2),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                '₦${totalIncome.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  const Icon(
                    Icons.arrow_upward,
                    color: Colors.green,
                    size: 18.0,
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    '${percentageChange.toStringAsFixed(1)}%',
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 14.0,
                    ),
                  ),
                  const Text(
                    ' vs last month',
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.5),
                      borderRadius: BorderRadius.circular(5)),
                  child: Icon(icon)),
              const SizedBox(
                height: 10,
              ),
              IconButton(
                onPressed: () {
                  // Handle "See Details" button press
                  print('See Details button pressed');
                },
                icon: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("See Details"),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
