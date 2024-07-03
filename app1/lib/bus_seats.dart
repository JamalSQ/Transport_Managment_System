import 'package:flutter/material.dart';




class bus_seats extends StatefulWidget {
  const bus_seats({super.key});

  @override
  _BusLayoutScreenState createState() => _BusLayoutScreenState();
}

class _BusLayoutScreenState extends State<bus_seats> {
  List<int> selectedSeats = [];
  double totalFare = 0.0;

  void calculateTotalFare() {
    totalFare = selectedSeats.length * 1250.0; // Assuming a fixed fare per seat
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Layout'),shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(50.0), // Adjust the radius as needed
        ),
      ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text(
                'Selected Seats: ${selectedSeats.length}',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: SizedBox(
                width: 340.0,
                child: BorderContainer(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        child: BusGrid(
                          initialSeatNumber: 1,
                          selectedSeats: selectedSeats,
                          onSeatSelected: (int seatNumber, String passengerType) {
                            setState(() {
                              if (selectedSeats.contains(seatNumber)) {
                                selectedSeats.remove(seatNumber);
                              } else {
                                selectedSeats.add(seatNumber);
                              }
                              calculateTotalFare();
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      Flexible(
                        child: BusGrid(
                          initialSeatNumber: 21,
                          selectedSeats: selectedSeats,
                          onSeatSelected: (int seatNumber, String passengerType) {
                            setState(() {
                              if (selectedSeats.contains(seatNumber)) {
                                selectedSeats.remove(seatNumber);
                              } else {
                                selectedSeats.add(seatNumber);
                              }
                              calculateTotalFare();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total Fare: Rs.${totalFare.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (selectedSeats.isNotEmpty) {
                // Implement your booking logic here or show a confirmation dialog.
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Booking Confirmation'),
                      content: Text('You have successfully booked ${selectedSeats.length} seat(s).'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please select at least one seat to book.'),
                  ),
                );
              }
            },
            child: const Text('Book Now'),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}

class BorderContainer extends StatelessWidget {
  final Widget child;

  const BorderContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2.0),
      ),
      child: child,
    );
  }
}

class BusGrid extends StatelessWidget {
  final int initialSeatNumber;
  final List<int> selectedSeats;
  final Function(int, String) onSeatSelected;

  const BusGrid({super.key, 
    this.initialSeatNumber = 1,
    required this.selectedSeats,
    required this.onSeatSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.3,
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        int seatNumber = initialSeatNumber + index;
        bool isSeatSelected = selectedSeats.contains(seatNumber);
        return BusSeat(
          seatNumber: seatNumber,
          isSelected: isSeatSelected,
          onSeatSelected: onSeatSelected,
        );
      },
    );
  }
}

class BusSeat extends StatefulWidget {
  final int seatNumber;
  final bool isSelected;
  final Function(int, String) onSeatSelected;

  const BusSeat({super.key, 
    required this.seatNumber,
    required this.isSelected,
    required this.onSeatSelected,
  });

  @override
  _BusSeatState createState() => _BusSeatState();
}

class _BusSeatState extends State<BusSeat> {
  bool isOccupied = false;
  String? passengerType;
  bool isMale = false;

  void _showSeatSelectionDialog() async {
    String? selectedGender = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Select Passenger Gender'),
          children: [
            ListTile(
              title: const Text('Male'),
              onTap: () {
                Navigator.pop(context, 'Male');
              },
            ),
            ListTile(
              title: const Text('Female'),
              onTap: () {
                Navigator.pop(context, 'Female');
              },
            ),
          ],
        );
      },
    );

    if (selectedGender != null) {
      setState(() {
        if (isOccupied) {
          // Deselect the seat if it was occupied and selected again
          isOccupied = false;
          passengerType = null;
          isMale = false;
          widget.onSeatSelected(widget.seatNumber, '');
        } else {
          isOccupied = true;
          passengerType = selectedGender;
          isMale = selectedGender == 'Male';
          widget.onSeatSelected(widget.seatNumber, passengerType!);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Color seatColor = isOccupied ? (isMale ? Colors.blue : Colors.pink) : Colors.green;

    return GestureDetector(
      onTap: () {
        if (!isOccupied) {
          _showSeatSelectionDialog();
        } else {
          // Deselect the seat if it's occupied and tapped again
          setState(() {
            isOccupied = false;
            passengerType = null;
            isMale = false;
          });
          widget.onSeatSelected(widget.seatNumber, '');
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: seatColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        margin: const EdgeInsets.all(4.0),
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            isOccupied ? (isMale ? 'Male' : 'Female') : 'Seat ${widget.seatNumber}',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
            ),
          ),
        ),
      ),
    );
  }
}
