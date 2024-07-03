import 'package:flutter/material.dart';

class aboutUs extends StatelessWidget {
  const aboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('About Us'),
          backgroundColor: Colors.indigo,
          shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(10.0), // Adjust the radius as needed
            ),
          ),
        ),
        body:const SingleChildScrollView(
          child:Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Welcome to MJ Transport Company!',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Who We Are',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'XYZ Transport Company is a trusted and reliable transportation service provider dedicated to serving our customers\' needs. We have been in the industry for over a decade, and our commitment to excellence has made us a leader in the field.',
                ),
                SizedBox(height: 16.0),
                Text(
                  'Our Services',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'At XYZ Transport Company, we offer a wide range of transportation services to meet your needs. Whether you require freight shipping, logistics solutions, or passenger transport, we have you covered. Our modern fleet of vehicles and experienced team ensure safe and timely deliveries.',
                ),
                SizedBox(height: 16.0),
                Text(
                  'Our Mission',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Our mission is to provide superior transportation solutions while maintaining the highest standards of safety, efficiency, and customer satisfaction. We strive to be a trusted partner in your transportation needs, delivering value and reliability every step of the way.',
                ),
                SizedBox(height: 16.0),
                Text(
                  'More about services',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'If you have any questions or would like to inquire about our services, please feel free to contact us. We are here to assist you and provide the best transportation solutions tailored to your requirements.If you have any questions or would like to inquire about our services, please feel free to contact us. We are here to assist you and provide the best transportation solutions tailored to your requirements.If you have any questions or would like to inquire about our services, please feel free to contact us. We are here to assist you and provide the best transportation solutions tailored to your requirements.If you have any questions or would like to inquire about our services, please feel free to contact us. We are here to assist you and provide the best transportation solutions tailored to your requirements.'
                      'If you have any questions or would like to inquire about our services, please feel free to contact us. We are here to assist you and provide the best transportation solutions tailored to your requirements.'
                      'If you have any questions or would like to inquire about our services, please feel free to contact us. We are here to assist you and provide the best transportation solutions tailored to your requirements.',
                ),
                SizedBox(height: 16.0),
                Text(
                  'Thank you for choosing MJ Transport Company for your transportation needs. We look forward to serving you!',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
