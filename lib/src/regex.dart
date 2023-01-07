import 'validation_type.dart';

/// Value must match pattern [expression]
class Regex extends ValidationType {
  final String expression;

  Regex(this.expression, super.errorMessage);

  @override
  bool isValid(String? inputValue) {
    return inputValue == null ? false : RegExp(expression).hasMatch(inputValue);
  }
}
