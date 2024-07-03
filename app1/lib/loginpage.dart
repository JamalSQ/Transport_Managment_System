import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'forgot_password.dart';
import 'sign_up.dart';
import 'MyApp.dart';
import 'Admin/adashboard.dart';
import 'user_model.dart';
import 'package:provider/provider.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<loginPage> {
  bool _passwordVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool loginStatus = false;
  bool _isLoading = false;
  bool LoggedIn = false;

  Future<void> _login() async {
    try {
      setState(() {
        _isLoading = true;
      });

// Show a loading dialog
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Column(
              children: [
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.indigo),
                ),
                SizedBox(height: 10.0),
                Text('Please Wait...'),
              ],
            ),
          );
        },
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      print("Logged in user: ${userCredential.user?.email}");

// Close the loading dialog
      Navigator.of(context).pop();

// Check if the logged-in user's email is admin@gmail.com
      // Check if the logged-in user's email is admin@gmail.com
      if (userCredential.user?.email == "admin@gmail.com") {
        print(userCredential.user?.uid);
        // storing log in state and UId
        Provider.of<UserModel>(context, listen: false).setLoggedIn(true,userCredential.user?.uid);
        // _saveSession(true);

        // Navigate to admin dashboard
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const adashboard(),
        ));
      } else {
        // Navigate to user dashboard upon successful login
        // storing log in state and UId
        Provider.of<UserModel>(context, listen: false).setLoggedIn(true,userCredential.user?.uid);
        // _saveSession(true);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ));
      }
    } on FirebaseAuthException catch (e) {
// Close the loading dialog
      Navigator.of(context).pop();

// Display an error dialog
      _showErrorDialog(e.message.toString());
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Logic to maintain Auth Sessions

  // void _saveSession(bool isLoggedIn) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setBool('isLoggedIn', isLoggedIn);
  //   Provider.of<UserModel>(context, listen: false).setLoggedIn(isLoggedIn);
  // }

  void _showErrorDialog(String errorMessage) {
    if (errorMessage == "Error") {
      errorMessage = "Invalid Username or Password";
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Login Error'),
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
        title: const Text('Login Page'),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(
                  Icons.login, // Replace with the bus icon
                  size: 100.0,
                  color: Colors.indigo, // Set color to indigo
                ),

                const SizedBox(height: 20.0),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    icon: Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  obscureText: !_passwordVisible,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    icon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                  child: const Text('Login'),
                ),
                const SizedBox(height: 10.0),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const forgot_password(),
                    ));
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.indigo,
                  ),
                  child: const Text('Forgot Password?'),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    const SizedBox(width: 5.0),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const sign_up(),
                        ));
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.indigo,
                      ),
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
