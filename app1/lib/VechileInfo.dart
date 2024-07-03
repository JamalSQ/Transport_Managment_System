import 'package:flutter/material.dart';

class VechileInfo extends StatelessWidget {
  const VechileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vechile info'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: 300,
          height: 400,
          margin: const EdgeInsets.fromLTRB(60.0, 10.0, 40.0, 0.0),
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 30.0, 10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue, // Border color
              width: 2.0, // Border width
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.all(40.0),
                  decoration: BoxDecoration(
                    color: Colors.blue, // Background color
                    border: Border.all(
                      color: Colors.white, // Border color
                      width: 2.0, // Border width
                    ),

                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                      offset: Offset(0, 8), // Shadow offset
                    ),
                  ],
                  ),
                  child: const Text(
                    'Please Select Route',
                    textAlign: TextAlign.center,
                    // overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,


                    ),
                  )),
              ElevatedButton(
                onPressed: () {
                  // Use Navigator to navigate to the second page
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const VechileInfo(),
                  ));
                },
                style: ElevatedButton.styleFrom(
                  elevation: 12.0,
                  textStyle: const TextStyle(color: Colors.white),
                ),
                child: const Text('Okara - Lahore'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Use Navigator to navigate to the second page
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const VechileInfo(),
                  ));
                },
                style: ElevatedButton.styleFrom(
                  elevation: 12.0,
                  textStyle: const TextStyle(color: Colors.white),
                ),
                child: const Text('Okara - Lahore'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Use Navigator to navigate to the second page
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const VechileInfo(),
                  ));
                },
                style: ElevatedButton.styleFrom(
                  elevation: 12.0,
                  textStyle: const TextStyle(color: Colors.white),
                ),
                child: const Text('Okara - Lahore'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
