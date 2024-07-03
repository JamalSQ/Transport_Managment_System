// import 'package:flutter/material.dart';
// import 'aboutUs.dart';
//
// void main() {
//   runApp(EmployeeData());
// }
//
//
// class EmployeeData extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Employee Data'),
//       ),
//       // drawer: AppDrawer(),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Container(
//               color: Colors.blueAccent,
//               padding: EdgeInsets.all(20),
//               child: Center(
//                 child: Text(
//                   'Employee Data',
//                   style: TextStyle(
//                     fontSize: 24.0,
//                     letterSpacing: 1,
//                     wordSpacing: 2,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             DataTable(
//               columnSpacing: 16.0,
//               dataRowHeight: 60.0,
//               columns: [
//                 DataColumn(
//                   label: Text(
//                     'Employee ID',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 DataColumn(
//                   label: Text(
//                     'Name',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 DataColumn(
//                   label: Text(
//                     'Position',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 DataColumn(
//                   label: Text(
//                     'Edit',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ],
//               rows: [
//                 DataRow(
//                   cells: [
//                     DataCell(Text('E101')),
//                     DataCell(Text('John Doe')),
//                     DataCell(Text('Manager')),
//                     DataCell(
//                       IconButton(
//                         icon: Icon(Icons.edit),
//                         onPressed: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => aboutUs(),
//                           ));
//                           // Add your desired action here when the edit button is pressed
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//                 DataRow(
//                   cells: [
//                     DataCell(Text('E102')),
//                     DataCell(Text('Jane Smith')),
//                     DataCell(Text('Developer')),
//                     DataCell(
//                       IconButton(
//                         icon: Icon(Icons.edit),
//                         onPressed: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => aboutUs(),
//                           ));
//                           // Add your desired action here when the edit button is pressed
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//                 // Add more rows as needed
//               ],
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Add your action to add a new employee
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
