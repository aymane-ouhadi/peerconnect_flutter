import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BottomSheetElement extends StatelessWidget {

  final Map<String, dynamic> option;

  const BottomSheetElement({super.key, required this.option});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 40),
      padding: const EdgeInsets.only(top: 0, right: 25, left: 25, bottom: 25),
      child: Row(
        children: [
          option["icon"],
          SizedBox(width: 30),
          Text(option["title"], style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          // Container(width: double.infinity, height: 1, color: Colors.grey,)
        ],
      ),
    );
  }
}