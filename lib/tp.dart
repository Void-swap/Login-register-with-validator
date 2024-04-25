import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpass = TextEditingController();
  bool isselected = true;
  bool isselected2 = true;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            const Text(
              "Registration",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: email,
              decoration: const InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: password,
              obscureText: isselected,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isselected = !isselected;
                    });
                  },
                  icon: isselected
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                ),
                hintText: "Password",
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: confirmpass,
              obscureText: isselected2,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isselected2 = !isselected2;
                    });
                  },
                  icon: isselected2
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                ),
                hintText: "Confirm Password",
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                if (email.text.isEmpty) {
                  _showSnackBar("Error", "Enter the Email");
                } else if (password.text.isEmpty) {
                  _showSnackBar("Error", "Enter the Password");
                } else if (confirmpass.text.isEmpty) {
                  _showSnackBar("Error", "Enter the Confirm Password");
                } else if (password.text.trim() != confirmpass.text.trim()) {
                  _showSnackBar("Error", "Passwords don't match");
                } else {
                  Get.to(LoginScreenss(
                    emaildetails: email.text.toString(),
                    passwdetails: password.text.toString(),
                  ));
                }
              },
              child: const Text("Register"),
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(String title, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        duration: Duration(seconds: 3),
        elevation: 5,
        backgroundColor: Colors.blueAccent,
        content: Container(
          height: 35,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 50),
              Icon(Icons.info_outline),
              SizedBox(width: 10),
              Text(
                message,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

class LoginScreenss extends StatefulWidget {
  const LoginScreenss(
      {super.key, required String emaildetails, required String passwdetails});

  @override
  State<LoginScreenss> createState() => _LoginScreenssState();
}

class _LoginScreenssState extends State<LoginScreenss> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
