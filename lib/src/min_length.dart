import 'validation_type.dart';

class MinLength extends ValidationType {
  final int length;

  MinLength(this.length, super.errorMessage);

  @override
  bool isValid(String? inputValue) {
    if (inputValue == null && length <= 0) {
      return true;
    }
    return inputValue == null ? false : inputValue.length >= length;
  }
}
