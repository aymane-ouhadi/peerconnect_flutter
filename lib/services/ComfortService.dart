//This class is a service that has static methods to format UI components

import 'package:intl/intl.dart';

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


}