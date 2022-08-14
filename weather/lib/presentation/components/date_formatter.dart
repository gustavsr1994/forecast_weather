import 'package:intl/intl.dart';

class DateFormatter {
  static formatTitle(String input) {
    var dateFormat = DateFormat('yyyy-MM-dd HH:mm');
    var date = dateFormat.parse(input);
    var output = DateFormat('EE, MMM dd, yyyy hh:mm a');
    return output.format(date);
  }

  static formatTitleComplete(String input) {
    var dateFormat = DateFormat('yyyy-MM-dd HH:mm');
    var date = dateFormat.parse(input);
    var output = DateFormat('EEEE, MMMM dd, yyyy \nhh:mm a');
    return output.format(date);
  }
}
