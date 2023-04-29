import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {

  final String image;
  final String title;
  final String? description;

  const EmptyState({
    Key? key,
    required this.image,
    required this.title,
    this.description
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(image, width: 210),
          SizedBox(height: 20),
          Text(title, style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          description != null ? Text(description as String, style: TextStyle(fontSize: 15, color: Colors.grey),) : Container()
        ],
      ),
    );
  }
}