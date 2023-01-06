import 'package:intl/intl.dart';
import 'time_constants.dart';
import 'validation_type.dart';

class MaxAge extends ValidationType {
  final int maxYears;
  final String dateFormat;

  MaxAge(this.maxYears, this.dateFormat, super.errorMessage);

  @override
  bool isValid(String? inputValue) {
    var isValid = true;
    try {
      final dateInMillis =
          DateFormat(dateFormat).parse(inputValue!).millisecondsSinceEpoch;
      final currentTime = DateTime.now().millisecondsSinceEpoch;
      final yearDifference =
          (currentTime - dateInMillis) / TimeConstants.yearInMilliseconds;
      if (yearDifference > maxYears) {
        isValid = false;
      }
    } catch (e) {
      errorMessage = "Invalid date format";
      isValid = false;
    }
    return isValid;
  }
}
