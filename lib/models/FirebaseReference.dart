import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseReference {

  static Future<String> uploadFile(String path, String fileName, XFile? file) async {

    //Get a reference to storage root
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child(path);

    //Create a reference to the image to be stored
    Reference referenceImageToUpload = referenceDirImages.child("${DateTime.now().millisecondsSinceEpoch}_${fileName}");

    //Uploading the image
    try {
      await referenceImageToUpload.putFile(
        File(file!.path)
      );

      return await referenceImageToUpload.getDownloadURL();
    } catch (e) {

      print("error : ${e.toString()}");

      return e.toString();
    }

  }

}