import 'package:flutter/material.dart';
import 'package:peerconnect_flutter/screens/auth/login.dart';
import 'package:peerconnect_flutter/screens/auth/register.dart';

class Routes {
  static final Map<String, Widget Function(BuildContext)> map = {
    "/login": (context) => Login(),
    "/register": (context) => Register(),
  }; 
}