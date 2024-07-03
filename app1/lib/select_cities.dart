import 'package:flutter/material.dart';
import 'available_buses.dart';

class SelectCities extends StatefulWidget {
  const SelectCities({super.key});

  @override
  _SelectCitiesState createState() => _SelectCitiesState();
}

class _SelectCitiesState extends State<SelectCities> {
  String? selectedDepartureCity; // Nullable String
  String? selectedArrivalCity;   // Nullable String

  final List<String> cities = [
    'Lahore',
    'Okara',
    'Sahiwal',
    'Chichawatni',
    'Multan',
    // Add your list of cities here
  ];

  bool isLoading = false; // Flag to control the loading animation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('Book a Ride'),
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10.0),
            // Adjust the radius as needed
          ),
        ),
      ),
      body: Stack(
        children: [
          // Background content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Add the container with the heading 'Select Route'
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    'Select Route',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),

                // Wrap both drop-downs in a Column
                Column(
                  children: [
                    buildDropdown(
                      hint: 'Select Departure City',
                      value: selectedDepartureCity,
                      onChanged: (newValue) {
                        setState(() {
                          selectedDepartureCity = newValue;
                        });
                      },
                    ),
                    const SizedBox(height: 20.0),
                    buildDropdown(
                      hint: 'Select Arrival City',
                      value: selectedArrivalCity,
                      onChanged: (newValue) {
                        setState(() {
                          selectedArrivalCity = newValue;
                        });
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {

                    // Show the loading animation
                    setState(() {
                      isLoading = true;
                    });

                    // Simulate loading delay
                    Future.delayed(const Duration(seconds: 3), () {
                      // Implement logic to show available buses for the selected cities.
                      setState(() {
                        isLoading = false; // Hide the loading animation
                      });

                      // Navigate to the 'AvailableBuses' screen
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const available_buses(),
                      ));
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo, // Set the background color to indigo
                  ),
                  child: const Text('Search Buses'),
                ),
              ],
            ),
          ),
          // Loading animation overlay
          if (isLoading)
            Container(
              color: Colors.black.withOpacity(0.6), // Semi-transparent black background
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.white, // Color of the loading spinner
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget buildDropdown({
    required String hint,
    required String? value,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Text(hint),
          value: value,
          onChanged: onChanged,
          items: cities.map((String city) {
            return DropdownMenuItem<String>(
              value: city,
              child: ListTile(
                title: Text(city),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

