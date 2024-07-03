import 'package:flutter/material.dart';
import 'AppDrawer.dart';
import 'adashboard.dart';
// import 'ticket_receipt.dart';

class CurrentBookedTickets extends StatelessWidget {
  const CurrentBookedTickets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booked Tickets'),
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
                    'User ID',
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
                    'Action',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              rows: [
                DataRow(
                  cells: [
                    const DataCell(Text('UID001')),
                    const DataCell(Text('1024')),
                    const DataCell(Text('10-10-2023')),
                    DataCell(
                      IconButton(
                        icon: const Icon(Icons.edit_note_rounded),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const adashboard(),
                          ));
                          // Add your desired action here when the edit button is pressed
                        },
                      ),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    const DataCell(Text('UID002')),
                    const DataCell(Text('1090')),
                    const DataCell(Text('10-11-2023')),
                    DataCell(
                      IconButton(
                        icon: const Icon(Icons.edit_note_rounded),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const adashboard(),
                          ));
                          // Add your desired action here when the edit button is pressed
                        },
                      ),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    const DataCell(Text('UID003')),
                    const DataCell(Text('9991')),
                    const DataCell(Text('13-11-2023')),
                    DataCell(
                      IconButton(
                        icon: const Icon(Icons.edit_note_rounded),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const adashboard(),
                          ));
                          // Add your desired action here when the edit button is pressed
                        },
                      ),
                    ),
                  ],
                ),
                // Add more rows with ticket information here
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _performAction(BuildContext context, String userID) {
    // Implement the action when the button is pressed
    print('Action performed for User ID: $userID');
    // You can add your logic here, such as navigating to another page or performing some operation.
  }
}
