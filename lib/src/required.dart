import 'validation_type.dart';

class Required extends ValidationType {
  Required(super.errorMessage);

  @override
  bool isValid(String? inputValue) {
    return inputValue != null && inputValue.isNotEmpty;
  }
}
