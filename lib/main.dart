import 'package:flutter/material.dart';
import 'package:peer_council_hub/tp.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
   
      debugShowCheckedModeBanner: false,
      //theme: ThemeData(),
      home: LoginScreen(),
    );
  }
}

