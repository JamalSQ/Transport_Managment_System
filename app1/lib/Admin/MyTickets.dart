import 'package:flutter/material.dart';
import 'AppDrawer.dart';

class MyTickets extends StatelessWidget {
  const MyTickets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yours Tckets'),
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              color: Colors.orange, // Background color
              padding: const EdgeInsets.all(20),
              child:const Center(
                child: Text(
                  'Your Upcomming Rides',
                  style: TextStyle(
                    fontSize: 24.0,
                    letterSpacing: 1,
                    wordSpacing: 2,
                    color: Colors.white, // Text color
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            DataTable(
              columnSpacing: 16.0,
              dataRowHeight: 60.0,
              columns: const [
                DataColumn(
                  label: Text(
                    'Ticket No',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Bus No',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Price',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),

              ],
              rows: const [
                DataRow(
                  cells: [
                    DataCell(Text('A10C01')),
                    DataCell(Text('1024')),
                    DataCell(Text('10-10-2023')),
                    DataCell(Text('200')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('X10C03')),
                    DataCell(Text('1090')),
                    DataCell(Text('10-11-2023')),
                    DataCell(Text('300')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Y10Z05')),
                    DataCell(Text('9991')),
                    DataCell(Text('13-11-2023')),
                    DataCell(Text('500')),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
