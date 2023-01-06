import 'validation_type.dart';
import 'package:intl/intl.dart';

class ValidDateFormat extends ValidationType {
  final String dateFormat;

  ValidDateFormat(this.dateFormat, super.errorMessage);

  @override
  bool isValid(String? inputValue) {
    try {
      DateFormat(dateFormat).parseStrict(inputValue!);
      return true;
    } catch (e) {
      return false;
    }
  }
}
