import 'validation_type.dart';

/// Value length must be lower than [length]
class MaxLength extends ValidationType {
  final int length;

  MaxLength(this.length, super.errorMessage);

  @override
  bool isValid(String? inputValue) {
    if (inputValue == null && length >= 0) {
      return true;
    }
    return inputValue == null ? false : inputValue.length <= length;
  }
}
