import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'loginpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class sign_up extends StatefulWidget {
  const sign_up({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<sign_up> {
  FirebaseAuth auth = FirebaseAuth.instance;

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  final TextEditingController _emailController = TextEditingController();
  bool _emailError = false;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _passwordsMatch = true;
  bool _passwordLengthError = false;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  String _selectedGender = ''; // Variable to store selected gender

  final bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();

  void _validateEmail(String value) {
    final isValid = EmailValidator.validate(value);
    setState(() {
      _emailError = !isValid;
    });
  }

  void _validatePasswords(String value) {
    if (_passwordController.text != _confirmPasswordController.text) {
      setState(() {
        _passwordsMatch = false;
      });
    } else {
      setState(() {
        _passwordsMatch = true;
      });
    }

    if (value.length < 8) {
      setState(() {
        _passwordLengthError = true;
      });
    } else {
      setState(() {
        _passwordLengthError = false;
      });
    }
  }

  void _handleSignUp() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Show a loading dialog
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return const AlertDialog(
              title: Column(
                children: [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.indigo), // Change color here
                  ), // Loading indicator
                  SizedBox(height: 10.0),
                  Text('Signing Up...'),
                ],
              ),
            );
          },
        );

        // Perform the sign-up
        UserCredential userCredential =
        await auth.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );

        User? user = userCredential.user;

        // Store user data in Firebase Realtime Database
        await FirebaseFirestore.instance.collection('users').doc(user?.uid).set({
          'fullName': _fullNameController.text,
          'email': _emailController.text,
          'phoneNumber': _phoneNumberController.text,
          'gender': _selectedGender, // Use the selected gender variable
          // Add other fields as needed
        });

        // Close the loading dialog
        Navigator.of(context).pop();

        print('User UID: ${user?.uid}');

        // Navigate to the login page on success
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const loginPage()),
        );
      } on FirebaseAuthException catch (e) {
        // Close the loading dialog
        Navigator.of(context).pop();

        // Display an error dialog
        _showErrorDialog(e.message.toString());
      } catch (e) {
        // Close the loading dialog
        Navigator.of(context).pop();
        print(e);

        // Display a generic error dialog
        _showErrorDialog('An error occurred. Please try again.');
      }
    }
  }

  void _showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sign Up Error'),
        content: Text(errorMessage),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: TextButton.styleFrom(foregroundColor: Colors.indigo),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('Sign Up Page'),
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10.0),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Icon(
                    Icons.app_registration, // Replace with the bus icon
                    size: 100.0,
                    color: Colors.indigo, // Set color to indigo
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: _fullNameController,
                    decoration: const InputDecoration(
                      labelText: 'Full Name',
                      icon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      icon: const Icon(Icons.email),
                      errorText: _emailError ? 'Invalid email format' : null,
                    ),
                    onChanged: _validateEmail,
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: _phoneNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      icon: Icon(Icons.phone),
                    ),
                    validator: (value) {
                      // Validity check for phone number
                      if (value == null ||
                          value.isEmpty ||
                          !value.startsWith('03') ||
                          value.length != 11) {
                        return 'Please enter a valid phone number starting with 03 and with a length of 11 digits.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  // Gender radio buttons in the same line
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const Text('Gender:', style: TextStyle(fontSize: 16)),
                      Radio(
                        value: 'Male',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value.toString();
                          });
                        },
                      ),
                      const Text('Male'),
                      Radio(
                        value: 'Female',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value.toString();
                          });
                        },
                      ),
                      const Text('Female'),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      icon: const Icon(Icons.lock),
                      errorText: _passwordLengthError
                          ? 'Password must be at least 8 characters'
                          : null,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password.';
                      }
                      return null;
                    },
                    onChanged: _validatePasswords,
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: !_isConfirmPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      icon: const Icon(Icons.lock),
                      errorText:
                      _passwordsMatch ? null : 'Passwords do not match',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isConfirmPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isConfirmPasswordVisible =
                            !_isConfirmPasswordVisible;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password.';
                      }
                      if (!_passwordsMatch) {
                        return 'Passwords do not match.';
                      }
                      return null;
                    },
                    onChanged: _validatePasswords,
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: _handleSignUp,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                    child: const Text('Sign Up'),
                  ),
                  const SizedBox(height: 20.0),
                  // Loading indicator
                  _isLoading ? const CircularProgressIndicator() : const SizedBox.shrink(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
