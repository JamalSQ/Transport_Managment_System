import 'package:flutter/material.dart';

class ReceiptPage extends StatelessWidget {
  const ReceiptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ticket Receipt'),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.indigo, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Stack(
            children: [
              ListView(
                children: [
                  buildBorderedSection(
                    child: const Center(
                      child: Text(
                        'Ticket',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                  buildReceiptRow('Ticket ID', 'T10C01'),
                  buildDivider(),
                  buildReceiptRow('Bus No', 'RWL1024'),
                  buildDivider(),
                  buildReceiptRow('Passengers', '2'),
                  buildDivider(),
                  buildReceiptRow('Genders', '1 M, 1 F'),
                  buildDivider(),
                  buildReceiptRow('Departure Time', '12:00 PM'),
                  buildDivider(),
                  buildReceiptRow('Arrival Time', '3:00 PM'),
                  buildDivider(),
                  buildReceiptRow('Departure Station', 'Lahore'),
                  buildDivider(),
                  buildReceiptRow('Arrival Station', 'Sahiwal'),
                  const SizedBox(height: 16.0),
                  buildBorderedSection(
                    child: buildReceiptRow('Total Fare', 'Rs.2500.00', isTotal: true),
                  ),
                ],
              ),
              const Positioned(
                bottom: 100.0,
                left: 250.0,
                child: Opacity(
                  opacity: 0.5,
                  child: Text(
                    'Date: 10 Oct, 2023',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                bottom: 80.0,
                left: 250.0,
                child: Opacity(
                  opacity: 0.5,
                  child: Text(
                    'Day: Wednesday',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBorderedSection({required Widget child}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.indigo, width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: child,
    );
  }

  Widget buildReceiptRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider() {
    return Container(
      height: 1.0,
      color: Colors.grey,
      margin: const EdgeInsets.symmetric(vertical: 4.0),
    );
  }
}
