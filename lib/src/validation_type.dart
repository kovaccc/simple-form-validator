/// All validation types must extend this class and it's method and property to be able to validate it with validation method
abstract class ValidationType {
  String errorMessage;

  bool isValid(String? inputValue);

  ValidationType(this.errorMessage);
}
