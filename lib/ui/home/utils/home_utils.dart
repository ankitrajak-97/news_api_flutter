import 'package:intl/intl.dart';

String modifyTitle({String? title}) {
  if (title == null) return "";
  if (title.contains('-')) {
    var parts = title.split("-");
    if (parts.isEmpty) return "";

    if (parts.length < 2) {
      parts.removeLast();
    }

    var joinedData = parts.join("-");

    return joinedData.trim();
  } else {
    return title.trim();
  }
}

String getStructuredDateTime(String? dateString) {
  if (dateString == null) return "";
  // String dateString = "2025-01-29T16:17:00Z";
  DateTime dateTime = DateTime.parse(dateString);

  // Convert to local time if needed
  dateTime = dateTime.toLocal();

  // Formatting date and time separately
  String formattedDate = DateFormat("MMM d, ''yy").format(dateTime);
  String formattedTime = DateFormat("hh:mm a").format(dateTime);

  // print("$formattedDate, $formattedTime"); // Output: Jan 29, '25, 04:17 PM
  return "$formattedDate, $formattedTime";
}
