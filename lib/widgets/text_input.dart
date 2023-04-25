import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final String value;
  final ValueSetter<String> onChanged;
  final ValueSetter<String>? onSubmitted;
  final TextInputType? keyboardType;
  final String hintText;

  const TextInput({
    Key? key,
    required this.value,
    required this.onChanged,
    this.onSubmitted,
    this.keyboardType,
    required this.hintText,
  }) : super(key: key);

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
