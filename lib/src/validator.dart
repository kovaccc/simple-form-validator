import 'validation_type.dart';

abstract class Validator {
  static String? validate(
      String? inputValue, List<ValidationType> validationTypes) {
    List<String?> errorMessages = [];

    for (var validationType in validationTypes) {
      var errorMessage = validationType.isValid(inputValue)
          ? null
          : validationType.errorMessage;
      if (errorMessage != null) {
        errorMessages.add(errorMessage);
      }
    }
    return errorMessages.isEmpty ? null : errorMessages.first;
  }
}