import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final String value;
  final ValueSetter<String> onChanged;
  final ValueSetter<String>? onSubmitted;
  final TextInputType? keyboardType;
  final String hintText;

  const PasswordInput({
    Key? key,
    required this.value,
    required this.onChanged,
    this.onSubmitted,
    this.keyboardType,
    required this.hintText,
  }) : super(key: key);

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  late TextEditingController _controller;

  bool isVisible = false;

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
      obscureText: !isVisible,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(isVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined ), 
          onPressed: () {
            setState(() {
              isVisible = !isVisible;
            });
          }
        )
      ),
    
    );
  }
}
