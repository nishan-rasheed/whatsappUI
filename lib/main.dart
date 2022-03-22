import 'package:flutter/material.dart';

import 'home_screen/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFF075E54),
        accentColor: Color(0xFF128C7E),
      ),
    home:HomeScreen()
    );
  }
}

