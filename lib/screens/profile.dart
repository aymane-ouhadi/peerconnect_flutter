import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:peerconnect_flutter/services/UIService.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: UIService.buildAppBar(),
      body: SafeArea(
        child: Container(
          child: Text("Profile Screen"),
        ),
      ),
    );
  }
}