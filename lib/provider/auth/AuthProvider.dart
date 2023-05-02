import 'package:flutter/material.dart';
import 'package:peerconnect_flutter/models/User.dart';

class AuthProvider extends ChangeNotifier {

  User _user = User.empty();

  User get user => _user;

  set user(User user){
    _user = user;
    notifyListeners();
  }

}