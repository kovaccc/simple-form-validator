import 'package:intl/intl.dart';
import 'time_constants.dart';
import 'validation_type.dart';

class MinAge extends ValidationType {
  final int minYears;
  final String dateFormat;

  MinAge(this.minYears, this.dateFormat, super.errorMessage);

  @override
  bool isValid(String? inputValue) {
    var isValid = true;
    try {
      final dateInMillis =
          DateFormat(dateFormat).parse(inputValue!).millisecondsSinceEpoch;
      final currentTime = DateTime.now().millisecondsSinceEpoch;
      final yearDifference =
          (currentTime - dateInMillis) / TimeConstants.yearInMilliseconds;
      if (yearDifference < minYears) {
        isValid = false;
      }
    } catch (e) {
      errorMessage = "Invalid date format";
      isValid = false;
    }
    return isValid;
  }
}
