//This class is a service that has static methods to format UI components
//All you'll see here is some methods I isolated here to keep the widgets as clean as possible

import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'dart:io';


class ComfortService {

  static String formatDate(String dateString) {
  // Parse the input string into a DateTime object
  DateTime dateTime = DateTime.parse(dateString);

  // Format the date portion of the DateTime object into a string like "May 1, 2023"
  String formattedDate = DateFormat.yMMMMd().format(dateTime);

  // Extract the day number from the formatted date string
  int dayNumber = int.parse(formattedDate.split(" ")[1].replaceAll(",", ""));

  // Convert the day number to a string with an ordinal suffix (e.g. "1st")
  String dayString;
  if (dayNumber % 10 == 1 && dayNumber != 11) {
    dayString = "${dayNumber}st";
  } else if (dayNumber % 10 == 2 && dayNumber != 12) {
    dayString = "${dayNumber}nd";
  } else if (dayNumber % 10 == 3 && dayNumber != 13) {
    dayString = "${dayNumber}rd";
  } else {
    dayString = "${dayNumber}th";
  }

  // Extract the year from the formatted date string
  String yearString = formattedDate.split(" ")[2];

  // Combine the day string, month string, and year string into a final formatted string
  String finalString = "${dayString} of ${formattedDate.split(" ")[0]} ${yearString}";
  return finalString;
}

  static String toTimeAgo(String dateString) {
    final dateTime = DateTime.parse(dateString);
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    return timeago.format(now.subtract(difference));
  }

  static Future<String> saveFile(XFile? xfile, String destinationPath) async {
    try {

      print("File name : ${xfile!.name}");

      final path = "${destinationPath}/${DateTime.now().millisecondsSinceEpoch}_${xfile!.name}";
      final file = File(xfile!.path);

      final ref = FirebaseStorage.instance.ref().child(path);
      await ref.putFile(file);

      return await ref.getDownloadURL();

    } catch (e) {
      print('Failed to save XFile: $e');
      return '';
    }
  }

  // static Future<String> saveFile(XFile? xfile, String destinationPath) async {
  //   try {
  //     if (xfile == null) {
  //       throw Exception('Invalid XFile provided.');
  //     }

  //     final originalName = path.basename(xfile.path);
  //     final fileName = '${DateTime.now().millisecondsSinceEpoch}_$originalName';

  //     final appDir = await getApplicationDocumentsDirectory();
  //     final savedDir = Directory('${appDir.path}/$destinationPath');
  //     if (!savedDir.existsSync()) {
  //       savedDir.createSync(recursive: true);
  //     }

  //     final savedFilePath = '${savedDir.path}/$fileName';

  //     final byteData = await xfile.readAsBytes();
  //     await File(savedFilePath).writeAsBytes(byteData.buffer.asUint8List());

  //     return savedFilePath;
  //   } catch (e) {
  //     print('Failed to save XFile: $e');
  //     return '';
  //   }
  // }
}