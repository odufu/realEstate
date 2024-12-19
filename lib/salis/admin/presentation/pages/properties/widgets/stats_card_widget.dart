import 'package:flutter/material.dart';

class StatsCards extends StatelessWidget {
  const StatsCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        Container(
          width: 250,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
                width: .5, color: Theme.of(context).colorScheme.primary),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Total Incomes",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .tertiary
                            .withOpacity(.3),
                        borderRadius: BorderRadius.circular(5)),
                    child: Icon(Icons.account_balance_wallet_outlined,
                        color: Theme.of(context).colorScheme.tertiary,
                        size: 40),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                "₦ 12,7812.09",
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
                        "+34.4%",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "vs last month",
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        "See Details",
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 12),
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
        ),
        Container(
          width: 250,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
                width: .5, color: Theme.of(context).colorScheme.primary),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Total Properties",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .tertiary
                            .withOpacity(.3),
                        borderRadius: BorderRadius.circular(5)),
                    child: Icon(Icons.apartment_outlined,
                        color: Theme.of(context).colorScheme.tertiary,
                        size: 40),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                "15,780 Unit",
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
                        "-8.5%",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "vs last month",
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        "See Details",
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 12),
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
        ),
        Container(
          width: 250,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
                width: .5, color: Theme.of(context).colorScheme.primary),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Unit Sold",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .tertiary
                            .withOpacity(.3),
                        borderRadius: BorderRadius.circular(5)),
                    child: Icon(Icons.sell_outlined,
                        color: Theme.of(context).colorScheme.tertiary,
                        size: 40),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                "893 Unit",
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
                        "+17%",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "vs last month",
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        "See Details",
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 12),
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
        ),
        Container(
          width: 250,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
                width: .5, color: Theme.of(context).colorScheme.primary),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Unit Pending",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .tertiary
                            .withOpacity(.3),
                        borderRadius: BorderRadius.circular(5)),
                    child: Icon(Icons.key_off_outlined,
                        color: Theme.of(context).colorScheme.tertiary,
                        size: 40),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                "459 Unit",
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
                        "-12%",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "vs last month",
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        "See Details",
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 12),
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
        ),
      ],
    );
  }
}
