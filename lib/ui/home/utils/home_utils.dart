import 'package:intl/intl.dart';

String modifyTitle({String? title}) {
  if (title == null) return "";

  // ankit-papai-rajak-belur => ankit-papai-rajak
  // nirjan-munshi-cgr
  var parts = title.split("-");
  // => [ankit, papai, rajak, belur]
  // => [nirjan, munshi, cgr]
  if (parts.isEmpty) return "";

  parts.removeLast();
  var joinedData = parts.join("-");
  return joinedData.trim();
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
