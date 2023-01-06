abstract class ValidationType {
  String errorMessage;

  bool isValid(String? inputValue);

  ValidationType(this.errorMessage);
}