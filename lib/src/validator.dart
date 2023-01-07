import 'validation_type.dart';

/// Class that contains [validate] method which will validate input value with given [validationTypes]. It will return
/// null or error message of first [ValidationType] that [inputValue] does not satisfy
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