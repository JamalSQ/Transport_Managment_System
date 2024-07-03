import 'package:app1/bus_seats.dart';
import 'package:flutter/material.dart';

class Bus {
  final String name;
  final String departureTime;
  final String fare;
  final IconData icon;
  final List<String> facilities;
  final String departureStation;
  final String arrivalStation;
  final double rating;
  final String busNumberPlate;
  final String? driverPhoto;
  final int seatsAvailable; // Added seatsAvailable field

  Bus(this.name, this.departureTime, this.fare, this.icon, this.facilities,
      this.departureStation, this.arrivalStation, this.rating, this.busNumberPlate, this.driverPhoto, this.seatsAvailable);
}


class BusCard extends StatefulWidget {
  final Bus bus;

  const BusCard({super.key, required this.bus});

  @override
  _BusCardState createState() => _BusCardState();
}

class _BusCardState extends State<BusCard> with SingleTickerProviderStateMixin {
  bool isExpanded = false;

  void showDriverDetailsPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Driver Details"),
          content: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40.0,
                      backgroundImage: widget.bus.driverPhoto != null
                          ? AssetImage(widget.bus.driverPhoto!)
                          : const AssetImage("assets/male_avatar.png"),
                    ),
                    const SizedBox(width: 16.0),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Driver Name: M. Sarwar"),
                        Text("Driver License: ABC123"),
                        Text("Driver Experience: 5 years"),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Driver's Experience",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 2.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(16.0),
              color: Theme.of(context).primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        widget.bus.icon,
                        size: 32.0,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 8.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.bus.name,
                            style: const TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Bus No. ${widget.bus.busNumberPlate}",
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        widget.bus.departureTime,
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            child: isExpanded
                ? Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Fare: ${widget.bus.fare}",
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    "Remaining Seats: ${widget.bus.seatsAvailable}", // Display seats available here
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    "Departure: ${widget.bus.departureStation}",
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    "Arrival: ${widget.bus.arrivalStation}",
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    "Facilities:",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Wrap(
                    children: widget.bus.facilities
                        .map((facility) => Padding(
                      padding: const EdgeInsets.only(
                        right: 8.0,
                        bottom: 4.0,
                      ),
                      child: Chip(
                        label: Text(facility),
                        backgroundColor: Colors.amber,
                      ),
                    ))
                        .toList(),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 16.0,
                        color: Colors.amber,
                      ),
                      Text(
                        " ${widget.bus.rating.toStringAsFixed(1)}",
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      const SizedBox(width: 4.0),
                      const Text(
                        "Rating",
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    "Time to Reach: 3 hours",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 16.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Implement booking functionality here
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const bus_seats(),
                            ));
                          },
                          child: const Text("Book"),
                        ),
                        const SizedBox(width: 16.0),
                        ElevatedButton(
                          onPressed: showDriverDetailsPopup,
                          child: const Text("Driver Details"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
                : Container(),
          )
        ],
      ),
    );
  }
}
