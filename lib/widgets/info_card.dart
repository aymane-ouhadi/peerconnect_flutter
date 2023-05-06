import 'package:flutter/material.dart';
import 'package:peerconnect_flutter/models/user.dart';

class InfoCard extends StatelessWidget {

  final User user;

  const InfoCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.all(Radius.circular(15)),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: Column(
          children: [
            Info(icon: Icons.email_outlined, value: user.email),
            SizedBox(height: 25,),
            Info(icon: Icons.business_center_outlined, value: user.major),
            SizedBox(height: 25,),
            Info(icon: Icons.school_outlined, value: user.college),
          ],
        ),
      ),
    );
  }
}

class Info extends StatelessWidget {

  final IconData icon;

  final String value;

  const Info({super.key, required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 20,),
        Text(value)
      ],
    );
  }
}