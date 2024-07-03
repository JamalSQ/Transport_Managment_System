import 'package:flutter/material.dart';
import 'AppDrawer.dart';
import 'MoreTripHisDet.dart';

class TripHis extends StatelessWidget {
  const TripHis({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('My Travel History'),
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
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
                    'Details',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              rows: [
                DataRow(
                  cells: [
                    const DataCell(Text('A10C01')),
                    const DataCell(Text('1024')),
                    const DataCell(Text('10-10-2023')),
                    DataCell(
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const MoreTripHisDet(),
                          ));
                          // Add your desired action here when the icon is pressed
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.remove_red_eye),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                DataRow(
                  cells: [
                    const DataCell(Text('X10C03')),
                    const DataCell(Text('1090')),
                    const DataCell(Text('10-11-2023')),
                    DataCell(
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const MoreTripHisDet(),
                          ));
                          // Add your desired action here when the icon is pressed
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.remove_red_eye),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    const DataCell(Text('Y10Z05')),
                    const DataCell(Text('9991')),
                    const DataCell(Text('13-11-2023')),
                    DataCell(
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const MoreTripHisDet(),
                          ));
                          // Add your desired action here when the icon is pressed
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.remove_red_eye),
                          ],
                        ),
                      ),
                    ),
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
