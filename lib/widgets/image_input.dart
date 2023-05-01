// ignore_for_file: unused_import, use_key_in_widget_constructors, unused_local_variable, prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use, sized_box_for_whitespace, avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:path/path.dart' as p;
import 'package:peerconnect_flutter/utils/my_colors.dart';


class ImageInput extends StatefulWidget {

  final String hintText;

  const ImageInput({
    Key? key,
    required this.hintText
  }) : super(key: key);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {

  XFile? image;

  final ImagePicker picker = ImagePicker();

  TextEditingController _controller = TextEditingController();

  bool isVisible = false;

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            GestureDetector(
              onTap: (){
                myAlert();
              },
              child: TextField(
                enabled: false,
                controller: _controller,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  border: const OutlineInputBorder(),
                  suffixIcon: Icon(
                    Icons.image_outlined
                  )
                ),
              ),
            ),
            image != null 
            ?
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          // print("Show");
                          isVisible = !isVisible;
                        });
                      },
                      child: Text(
                        "Show", 
                        style: TextStyle(fontSize: 12),
                      )
                    ),
                    const SizedBox(width: 70),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          image = null;
                          isVisible = false;
                          // print("Cancel");
                        });
                      },
                      child: Text(
                        "Cancel", 
                        style: TextStyle(fontSize: 12, color: MyColors.primaryColor),
                        )
                      ),
                  ],
                )
              )
            :
            SizedBox(width: 15,),
            //if image not null show the image
            //if image null show text
            isVisible
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        //to show image, you type like this.
                        File(image!.path),
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                      ),
                    ),
                  )
                : SizedBox(width: 15,),
          ],
    );
  }
}