import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:peerconnect_flutter/screens/home.dart';
import 'package:peerconnect_flutter/screens/login.dart';
import 'package:peerconnect_flutter/utils/my_colors.dart';
import 'package:peerconnect_flutter/utils/routes.dart';

import 'package:peerconnect_flutter/provider/auth/AuthProvider.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider<AuthProvider>(
      create: (_) => AuthProvider(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: MaterialColor(
          MyColors.primaryColor.value,
          {
            50: MyColors.primaryColor.withOpacity(0.1),
            100: MyColors.primaryColor.withOpacity(0.2),
            200: MyColors.primaryColor.withOpacity(0.3),
            300: MyColors.primaryColor.withOpacity(0.4),
            400: MyColors.primaryColor.withOpacity(0.5),
            500: MyColors.primaryColor.withOpacity(0.6),
            600: MyColors.primaryColor.withOpacity(0.7),
            700: MyColors.primaryColor.withOpacity(0.8),
            800: MyColors.primaryColor.withOpacity(0.9),
            900: MyColors.primaryColor.withOpacity(1),
          }
        )
      ),
      home: const Home(),
      initialRoute: "/login",
      routes: Routes.map
    );
  }
  
}
