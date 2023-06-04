import 'validation_type.dart';

/// Value should not be null or empty String
class Required extends ValidationType {
  Required(super.errorMessage);

  @override
  bool isValid(String? inputValue) {
    return inputValue != null && inputValue.trim().isNotEmpty;
  }
}
