import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'home_screen/homescreen.dart';
import 'home_screen/pages/camera_page.dart';

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();

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

