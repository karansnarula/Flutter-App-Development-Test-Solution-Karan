import 'package:intl/intl.dart';

class DateFormatter {
  static String formatDate(String publishedDate) {
    var inputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss");
    var inputDate = inputFormat.parse(publishedDate); // <-- dd/MM 24H format
    var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }
}
