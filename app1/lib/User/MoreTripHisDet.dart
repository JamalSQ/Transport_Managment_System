import 'package:flutter/material.dart';


class MoreTripHisDet extends StatefulWidget {
  const MoreTripHisDet({super.key});

  @override
  _MoreTripHisstate createState() => _MoreTripHisstate();
}
class _MoreTripHisstate extends State<MoreTripHisDet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Detailed page"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              color: Colors.blueAccent, // Background color
              padding: const EdgeInsets.all(20),
              child:const Center(
                child: Text(
                  'More Info',
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
            ListView(
              shrinkWrap: true,
              children: const [
                EducationRow(
                  leftText: 'ID',
                  rightText1: 'A12C34',

                ),
                EducationRow(
                  leftText: 'Bus NO',
                  rightText1: '1024',

                ),
                EducationRow(
                  leftText: 'Price',
                  rightText1: '200',

                ),
                EducationRow(
                  leftText: 'Date',
                  rightText1: '10-10-2023',
                ),
                EducationRow(
                  leftText: 'Route',
                  rightText1: 'Okara - lahore',
                ),
                EducationRow(
                  leftText: 'No of Tickets',
                  rightText1: '2',
                ),
                EducationRow(
                  leftText: 'Genders',
                  rightText1: '1 Male - 1 Female',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class EducationRow extends StatelessWidget {
  final String leftText;
  final String rightText1;


  const EducationRow({super.key, 
    required this.leftText,
    required this.rightText1,

  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftText,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(rightText1),

          ],
        ),
        // Container(
        //   width: 1.0, // Width of the vertical line
        //   color: Colors.blue,
        //   height: 60.0, // Height of the line (match the row height)
        // ),
        // Expanded(
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Text(rightText1),
        //
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
