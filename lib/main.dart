import 'package:flutter/material.dart';
import 'package:peerconnect_flutter/screens/auth/register.dart';
import 'package:peerconnect_flutter/utils/routes.dart';

import 'screens/auth/login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Scaffold(
        body: Center(
          child: Register(),
        ),
      ),
      routes: Routes.map
    );
  }
}
