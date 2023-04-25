import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AuthHeader extends StatelessWidget {

  final String header;
  final String subText;

  const AuthHeader({
    Key? key, 
    required this.header,
    required this.subText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(
        top: 19 + 100
      ),
      child: Column(

        children: [
          Text(
            header,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30
            ),
          ),
          const SizedBox(height: 30),
          Text(
            subText,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14
            ),
          ),
        ],
      ),
    );
  }
}