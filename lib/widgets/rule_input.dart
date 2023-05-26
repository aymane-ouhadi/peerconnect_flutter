import 'package:flutter/material.dart';
import 'package:peerconnect_flutter/utils/my_colors.dart';

class RuleInput extends StatefulWidget {
  final String value;
  final ValueSetter<String> onChanged;
  final ValueSetter<String>? onSubmitted;
  final Function(String) onSuffixIconTap;
  final TextInputType? keyboardType;
  final String hintText;

  const RuleInput({
    Key? key,
    required this.value,
    required this.onChanged,
    this.onSubmitted,
    this.keyboardType,
    required this.hintText, 
    required this.onSuffixIconTap,
  }) : super(key: key);

  @override
  _RuleInputState createState() => _RuleInputState();
}

class _RuleInputState extends State<RuleInput> {
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
        suffixIcon: GestureDetector(
          onTap: (){
            widget.onSuffixIconTap(_controller.text);
          },
          child: Icon(Icons.add, size: 35, color: MyColors.primaryColor,),
        )
      ),
    );
  }
}
