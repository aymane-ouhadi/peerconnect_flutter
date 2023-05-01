import 'package:flutter/material.dart';
import 'package:peerconnect_flutter/screens/home.dart';
import 'package:peerconnect_flutter/utils/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/home",
      home: const Home(),
      routes: Routes.map
    );
  }
  
}
