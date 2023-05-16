// ignore_for_file: unused_import, use_key_in_widget_constructors, unused_local_variable, prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use, sized_box_for_whitespace, avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:path/path.dart' as p;
import 'package:peerconnect_flutter/services/ComfortService.dart';
import 'package:peerconnect_flutter/utils/my_colors.dart';


class DateInput extends StatefulWidget {

  final String hintText;
  final Function onTap;

  const DateInput({
    Key? key,
    required this.hintText,
    required this.onTap,
  }) : super(key: key);

  @override
  _DateInputState createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> {

  

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            GestureDetector(
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(), //get today's date
                    firstDate: DateTime.now(), //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(3000)
                );
                
                if(pickedDate != null ){
                    String formattedDate = ComfortService.formatDate(pickedDate.toIso8601String()); 

                    setState(() {
                      _controller.text = formattedDate; //set foratted date to TextField value. 
                    });
                }
                else{
                    print("Date is not selected");
                }

                widget.onTap(pickedDate!.toIso8601String());

              },
              child: TextField(
                readOnly: true,
                enabled: false,
                controller: _controller,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  border: const OutlineInputBorder(),
                  suffixIcon: Icon(
                    Icons.lock_clock_outlined
                  )
                ),
              ),
            ),
          ]
    );
  }
}