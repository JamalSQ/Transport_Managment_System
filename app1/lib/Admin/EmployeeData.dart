import 'package:app1/aboutUs.dart';
import 'package:flutter/material.dart';
import 'AppDrawer.dart';
import 'adashboard.dart';
import 'AddEmployee.dart';
 // Assuming you have a page for editing employee data

class EmployeeData extends StatelessWidget {
  const EmployeeData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Data'),
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
                    'Emp ID',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Position',
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
                    const DataCell(Text('E101')),
                    const DataCell(Text('Saif Javed')),
                    const DataCell(Text('Manager')),
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
                    const DataCell(Text('E102')),
                    const DataCell(Text('Farukh ')),
                    const DataCell(Text('Developer')),
                    DataCell(
                      IconButton(
                        icon: const Icon(Icons.edit_note_rounded),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const aboutUs(),
                          ));
                          // Add your desired action here when the edit button is pressed
                        },
                      ),
                    ),
                  ],
                ),
                // Add more rows as needed
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AddEmployee(),
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
