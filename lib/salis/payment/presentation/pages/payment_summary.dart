import 'package:flutter/material.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/utils/helper_functions.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../../../props/data/property.dart';

class PaymentSummary extends StatelessWidget {
  final Property property;
  final double payment;

  const PaymentSummary(
      {required this.payment, required this.property, super.key});

  @override
  Widget build(BuildContext context) {
    final myWidth = MediaQuery.of(context).size.width * 0.95;

    return Scaffold(
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)],
        ),
        child: AppButton(
          text: "Make Initial Payment",
          onPress: () {
            // Add payment logic here
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Processing payment..."),
              backgroundColor: Colors.green,
            ));
          },
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Payment Summary',
          style: TextStyle(color: Theme.of(context).colorScheme.surface),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPropertyInfo(context, myWidth),
              const SizedBox(height: 20),
              _buildPaymentSummary(context, myWidth),
              const SizedBox(height: 20),
              _buildInstallmentDetails(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPropertyInfo(BuildContext context, double myWidth) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                property.title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                property.address,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              const SizedBox(height: 16),
              Text(
                'Total Cost: ₦${property.price}',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentSummary(BuildContext context, double myWidth) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Payment Summary',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary),
              ),
              const SizedBox(height: 8),
              Text(
                'Amount Paying: ₦${payment.toStringAsFixed(2)}',
                style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.onPrimary),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInstallmentDetails(BuildContext context) {
    // Get the payment amounts and schedules from the installment plan
    final paymentAmounts = property.installmentPlan?.paymentAmounts ?? [];
    final paymentSchedules = property.installmentPlan?.paymentSchedules ?? [];

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Installment Details',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            if (paymentAmounts.isNotEmpty && paymentSchedules.isNotEmpty)
              Table(
                columnWidths: const {
                  0: FixedColumnWidth(40), // Number column
                  1: FlexColumnWidth(), // Date column
                  2: IntrinsicColumnWidth(), // Amount column
                },
                border: TableBorder.all(color: Colors.grey.shade300),
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.1),
                    ),
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          '#',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Due Date',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Amount',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                  ...List.generate(paymentAmounts.length, (index) {
                    return TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${index + 1}',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            formatDate(paymentSchedules[
                                index]), // Format date for display
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '₦${paymentAmounts[index].toStringAsFixed(2)}',
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    );
                  }),
                ],
              )
            else
              const Text('No installment details available.'),
          ],
        ),
      ),
    );
  }

// Helper function to format dates
  String formatDate(DateTime date) {
    return '${date.day}₦{date.month}₦{date.year}';
  }
}
