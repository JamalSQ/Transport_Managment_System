
import 'package:flutter/material.dart';
// import 'bus_seats.dart';
import 'bus_cards.dart';

class available_buses extends StatefulWidget {
  const available_buses({super.key});

  @override
  _AvailableBusesPageState createState() => _AvailableBusesPageState();
}

class _AvailableBusesPageState extends State<available_buses> {
  String selectedTimeRange = "";
  final List<Bus> buses = [
    Bus(
      "Bus 1",
      "5:05 AM",
      "Rs.1250",
      Icons.directions_bus,
      ["Wi-Fi", "Power Outlets", "Snack Service"],
      "Lahore",
      "Okara",
      4.5,
      "XYZ123", // Bus Number Plate
      "assets/driver_photo.jpg", // Driver's Photo
      40
    ),
    Bus(
      "Bus 2",
      "10:35 AM",
      "Rs.1020",
      Icons.directions_bus,
      ["Wi-Fi", "Power Outlets"],
      "Sahiwal",
      "Chichawatni",
      3.8,
      "ABC456", // Bus Number Plate
      null, // Driver's Photo is not available
      40
    ),
  ];

  TimeOfDay selectedStartTime = const TimeOfDay(hour: 4, minute: 0);
  TimeOfDay selectedEndTime = const TimeOfDay(hour: 16, minute: 0);

  @override
  Widget build(BuildContext context) {
    final filteredBuses = buses.where((bus) {
      final departureTime = TimeOfDay(
        hour: int.parse(bus.departureTime.split(':')[0]),
        minute: int.parse(bus.departureTime.split(':')[1].replaceAll(' AM', '').replaceAll(' PM', '')),
      );
      final now = DateTime.now();
      final departureDateTime = DateTime(
        now.year,
        now.month,
        now.day,
        departureTime.hour,
        departureTime.minute,
      );
      final startDateTime = DateTime(
        now.year,
        now.month,
        now.day,
        selectedStartTime.hour,
        selectedStartTime.minute,
      );
      final endDateTime = DateTime(
        now.year,
        now.month,
        now.day,
        selectedEndTime.hour,
        selectedEndTime.minute,
      );

      return departureDateTime.isAfter(startDateTime) && departureDateTime.isBefore(endDateTime);
    }).toList();

    final isBusesAvailable = filteredBuses.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Available Buses"),
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50.0), // Adjust the radius as needed
          ),
        ),
      ),

      body: Center(
        child: isBusesAvailable
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildTimeRangeContainer(selectedTimeRange),
            Expanded(
              child: ListView.builder(
                itemCount: filteredBuses.length,
                itemBuilder: (context, index) {
                  return BusCard(bus: filteredBuses[index]);
                },
              ),
            ),
          ],
        )
            : const Text(
          "No buses available at this time slot.",
          style: TextStyle(fontSize: 18.0),
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _resetTimeFilter(); // Reset the time filter when this button is pressed
            },
            backgroundColor: Colors.blue,
            child: const Icon(Icons.refresh),
          ),
          const SizedBox(height: 16.0), // Add some space between the buttons
          FloatingActionButton(
            onPressed: () {
              _showTimeFilterDialog(context);
            },
            backgroundColor: Colors.blue,
            child: const Icon(Icons.filter_list),
          ),
        ],
      ),



    );
  }

  void _resetTimeFilter() {
    setState(() {
      selectedStartTime = const TimeOfDay(hour: 0, minute: 0);
      selectedEndTime = const TimeOfDay(hour: 23, minute: 59);

      if (selectedTimeRange.isNotEmpty) {
        // Clear the selected time range and show all available buses
        selectedTimeRange = "All Buses";
      } else {
        // Set the selected time range to "All Buses" and show all available buses
        selectedTimeRange = "All Buses";
      }
    });
  }



  Future<void> _showTimeFilterDialog(BuildContext context) async {
    TimeOfDay? newStartTime = selectedStartTime;
    TimeOfDay? newEndTime = selectedEndTime;



    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Time Filter"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Select Start Time"),
              _buildTimePicker(
                selectedStartTime,
                    (time) => newStartTime = time,
                selectedStartTime.period == DayPeriod.am ? 'AM' : 'PM',
              ),
              const SizedBox(height: 12),
              const Text("Select End Time"),
              _buildTimePicker(
                selectedEndTime,
                    (time) => newEndTime = time,
                selectedEndTime.period == DayPeriod.am ? 'AM' : 'PM',
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  selectedStartTime = newStartTime!;
                  selectedEndTime = newEndTime!;
                  selectedTimeRange =
                  "${selectedStartTime.format(context)} - ${selectedEndTime.format(context)}";
                });
                Navigator.of(context).pop();
              },
              child: const Text("Apply"),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTimePicker(
      TimeOfDay initialTime,
      Function(TimeOfDay) onTimeChanged,
      String timePeriod,
      ) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${initialTime.hourOfPeriod}:${initialTime.minute.toString().padLeft(2, '0')} $timePeriod",
            style: const TextStyle(fontSize: 18),
          ),
          IconButton(
            icon: const Icon(Icons.access_time),
            onPressed: () async {
              final selectedTime = await showTimePicker(
                context: context,
                initialTime: initialTime,
              );

              if (selectedTime != null) {
                onTimeChanged(selectedTime);
              }
            },
          ),
        ],
      ),
    );
  }
}

Widget _buildTimeRangeContainer(String timeRange) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 16.0),
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(10.0),
    ),
    padding: const EdgeInsets.all(16.0),
    child: Text(
      "Time Range: $timeRange",
      style: const TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}

