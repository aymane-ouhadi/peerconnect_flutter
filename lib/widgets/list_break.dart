import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ListBreak extends StatelessWidget {

  final String message;

  const ListBreak({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: double.infinity,
          height: 2,
        ),
        Text(
          message
        ),
        SizedBox(
          width: double.infinity,
          height: 2,
        ),
      ],
    );
  }
}