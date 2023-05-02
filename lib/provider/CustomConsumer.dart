import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomConsumer<T extends ChangeNotifier> extends StatelessWidget {

  final Widget child;

  const CustomConsumer({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(
      builder: (BuildContext context, T provider, Widget? widget){
        return child;
      },
    );
  }
}