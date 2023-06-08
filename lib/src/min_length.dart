import 'validation_type.dart';

/// Value length must be greater than [length]
class MinLength extends ValidationType {
  final int length;

  MinLength(this.length, super.errorMessage);

  @override
  bool isValid(String? inputValue) {
    if (inputValue == null && length <= 0) {
      return true;
    }
    return inputValue == null ? false : inputValue.trim().length >= length;
  }
}
