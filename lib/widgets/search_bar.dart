import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final String value;
  final ValueSetter<String> onChanged;
  final ValueSetter<String>? onSubmitted;
  final TextInputType? keyboardType;
  final String hintText;

  const SearchBar({
    Key? key,
    required this.value,
    required this.onChanged,
    this.onSubmitted,
    this.keyboardType,
    required this.hintText,
  }) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
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
        // prefixIcon: const Icon(Icons.search_outlined),
        suffixIcon: IconButton(
          onPressed: (){
            _controller.clear();
          },
          icon: widget.value == "" ? Icon(Icons.search_outlined) : Icon(Icons.close),
        )
      ),
    );
  }
}
