// ignore_for_file: unnecessary_null_comparison, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  String email = "", password = "", name = "";
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  TextEditingController mailcontroller = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  registration() async {
    if (password != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: const Color.fromARGB(255, 81, 146, 83),
              content: Container(
                padding: EdgeInsets.all(8),
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Colors.white70,
                      size: 40,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Welcome! You're Registered Successfully",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )),
        );
        // ignore: use_build_context_synchronously
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => EntryPoint()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Password Provided is too Weak",
                style: TextStyle(fontSize: 18.0),
              )));
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Account Already exists",
                style: TextStyle(fontSize: 18.0),
              )));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Name",
                style: TextStyle(color: Colors.black54),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: TextFormField(
                  controller: namecontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your name"; // Return error message
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Name",
                    hintStyle: TextStyle(color: Colors.black26),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black26),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: SvgPicture.asset("assets/icons/person.svg"),
                    ),
                  ),
                ),
              ),
              const Text(
                "Email",
                style: TextStyle(color: Colors.black54),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: TextFormField(
                  controller: mailcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ""; // Return empty string
                    }
                    if (!value.contains("@")) {
                      return "Invalid email address"; // Return error message
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.black26),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black26),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: SvgPicture.asset("assets/icons/email.svg"),
                    ),
                  ),
                ),
              ),
              const Text(
                "Password",
                style: TextStyle(color: Colors.black54),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: TextFormField(
                  controller: passwordcontroller,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "";
                    }
                    if (value.length < 7) {
                      return "Password must be more than 7 characters";
                    }
                    if (!value.contains(RegExp(r'[A-Z]'))) {
                      return "Use at least one uppercase letter";
                    }
                    if (!value.contains(RegExp(r'[0-9]'))) {
                      return "Use at least one digit";
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "password",
                    hintStyle: TextStyle(color: Colors.black26),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black26),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: SvgPicture.asset("assets/icons/password.svg"),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 24),
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      setState(() {
                        email = mailcontroller.text;
                        name = namecontroller.text;
                        password = passwordcontroller.text;
                      });
                    }
                    registration();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF77D8E),
                    minimumSize: const Size(double.infinity, 56),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      ),
                    ),
                  ),
                  icon: const Icon(
                    CupertinoIcons.arrow_right,
                    color: Color(0xFFFE0037),
                  ),
                  label: const Text("Sign Un"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
