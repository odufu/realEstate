import 'package:flutter/material.dart';
import '/salis/admin/presentation/pages/invoice/invoice_preview_page.dart';
import '/salis/core/utils/helper_functions.dart';

class InvoiceGenerationPage extends StatefulWidget {
  const InvoiceGenerationPage({super.key});

  @override
  _InvoiceGenerationPageState createState() => _InvoiceGenerationPageState();
}

class _InvoiceGenerationPageState extends State<InvoiceGenerationPage> {
  // Controllers for input fields
  final TextEditingController _customerNameController = TextEditingController();
  final TextEditingController _propertyDetailsController =
      TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _invoiceDateController = TextEditingController();
  final TextEditingController _paymentMethodController =
      TextEditingController();

  // Form Key
  final _formKey = GlobalKey<FormState>();

  // Invoice Data (placeholder for generated invoice)
  Map<String, String> _invoiceData = {};

  @override
  void dispose() {
    _customerNameController.dispose();
    _propertyDetailsController.dispose();
    _amountController.dispose();
    _invoiceDateController.dispose();
    _paymentMethodController.dispose();
    super.dispose();
  }

  void _generateInvoice() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _invoiceData = {
          'Customer Name': _customerNameController.text,
          'Property Details': _propertyDetailsController.text,
          'Amount': _amountController.text,
          'Invoice Date': _invoiceDateController.text,
          'Payment Method': _paymentMethodController.text,
        };
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E2E),
        title: const Text('Generate Invoice', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInputField(
                    label: 'Customer Name',
                    controller: _customerNameController,
                    hint: 'Enter customer name',
                  ),
                  const SizedBox(height: 16),
                  _buildInputField(
                    label: 'Property Details',
                    controller: _propertyDetailsController,
                    hint: 'Enter property details',
                  ),
                  const SizedBox(height: 16),
                  _buildInputField(
                    label: 'Amount',
                    controller: _amountController,
                    hint: 'Enter transaction amount',
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16),
                  _buildInputField(
                    label: 'Invoice Date',
                    controller: _invoiceDateController,
                    hint: 'Enter invoice date (e.g., 2024-12-10)',
                  ),
                  const SizedBox(height: 16),
                  _buildInputField(
                    label: 'Payment Method',
                    controller: _paymentMethodController,
                    hint: 'Enter payment method (e.g., Mastercard)',
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: HelperFunctions.routeReplacdTo(
                          const InvoicePage(), context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: Text('Generate Invoice'),
                    ),
                  ),
                ],
              ),
            ),
            if (_invoiceData.isNotEmpty) _buildInvoicePreview(),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 16)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white54),
            filled: true,
            fillColor: const Color(0xFF1E1E2E),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildInvoicePreview() {
    return Card(
      margin: const EdgeInsets.only(top: 24),
      color: const Color(0xFF1E1E2E),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Invoice Preview',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const Divider(color: Colors.white70),
            ..._invoiceData.entries.map(
              (entry) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  '${entry.key}: ${entry.value}',
                  style: const TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle saving or exporting the invoice
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                child: Text('Save Invoice'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InvoiceGenerationPage(),
    ));
