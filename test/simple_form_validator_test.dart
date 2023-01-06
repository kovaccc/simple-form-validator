import 'package:simple_form_validator/simple_form_validator.dart';
import 'package:test/test.dart';

void main() {
  group('Required test', () {
    const String errorText = "Input is required";

    test('calling validate with an empty value will return $errorText}', () {
      expect(errorText, Validator.validate("", [Required(errorText)]));
    });

    test('calling validate with a null value will return $errorText}', () {
      expect(errorText, Validator.validate(null, [Required(errorText)]));
    });

    test('calling validate with a value will return null', () {
      expect(null, Validator.validate("Valid input", [Required(errorText)]));
    });
  });

  group('MinLength test', () {
    const String errorText = "Invalid minimal length";

    test(
        'calling validate with an empty value while minimal length is 1 will return $errorText',
        () {
      expect(errorText, Validator.validate("", [MinLength(1, errorText)]));
    });

    test(
        'calling validate with a null value while minimal length is 2 will return $errorText}',
        () {
      expect(errorText, Validator.validate(null, [MinLength(2, errorText)]));
    });

    test(
        'calling validate with a null value while minimal length is 0 will return null',
        () {
      expect(null, Validator.validate(null, [MinLength(0, errorText)]));
    });

    test(
        'calling validate with some value that matches minimal length will return null',
        () {
      expect(null, Validator.validate("ma", [MinLength(2, errorText)]));
    });

    test(
        'calling validate with a value that is greater than minimal length will return null',
        () {
      expect(null, Validator.validate("mat", [MinLength(2, errorText)]));
    });
  });

  group('MaxLength test', () {
    const String errorText = "Invalid maximum length";

    test(
        'calling validate with an empty value while maximum length is 1 will return null',
        () {
      expect(null, Validator.validate("", [MaxLength(1, errorText)]));
    });

    test(
        'calling validate with a null value while maximum length is 2 will return null',
        () {
      expect(null, Validator.validate(null, [MaxLength(2, errorText)]));
    });

    test(
        'calling validate with a null value while maximum length is 0 will return null',
        () {
      expect(null, Validator.validate(null, [MaxLength(0, errorText)]));
    });

    test(
        'calling validate with some value that matches maximum length will return null',
        () {
      expect(null, Validator.validate("ma", [MaxLength(2, errorText)]));
    });

    test(
        'calling validate with a value that is lower than maximum length will return null',
        () {
      expect(null, Validator.validate("mat", [MaxLength(5, errorText)]));
    });

    test(
        'calling validate with a value that is greater than maximum length will return $errorText',
        () {
      expect(errorText, Validator.validate("mat", [MaxLength(2, errorText)]));
    });
  });

  group('Regex test', () {
    const String errorText = "Invalid pattern";

    test(
        'calling validate with regular expression that matches pattern will return null',
        () {
      expect(
          null,
          Validator.validate("+385347155",
              [Regex(r'^(?:[+0][1-9])?[0-9]{0,12}$', errorText)]));
    });

    test(
        'calling validate with regular expression that matches pattern will return null',
        () {
      expect(
          null,
          Validator.validate(
              "+123456", [Regex(r'^(?:[+0][1-9])?[0-9]{0,12}$', errorText)]));
    });

    test(
        'calling validate with regular expression that does not matches pattern will return $errorText',
        () {
      expect(
          errorText,
          Validator.validate(
              "ma00", [Regex(r'^(?:[+0][1-9])?[0-9]{0,12}$', errorText)]));
    });

    test('calling validate with null will return $errorText', () {
      expect(
          errorText,
          Validator.validate(
              null, [Regex(r'^(?:[+0][1-9])?[0-9]{0,12}$', errorText)]));
    });
  });

  group('ValidDateFormat test', () {
    const String errorText = "Invalid date format";

    test('calling validate with date that matches date format will return null',
        () {
      expect(
          null,
          Validator.validate(
              "12/03/2021", [ValidDateFormat("dd/MM/yyyy", errorText)]));
    });

    test(
        'calling validate with date that does not matches date format will return $errorText',
        () {
      expect(
          errorText,
          Validator.validate(
              "12.03.2021", [ValidDateFormat("dd/MM/yyyy", errorText)]));
    });

    test(
        'calling validate with date that does not exist will return $errorText',
        () {
      expect(
          errorText,
          Validator.validate(
              "12/13/2021", [ValidDateFormat("dd/MM/yyyy", errorText)]));
    });

    test('calling validate with null value will return $errorText', () {
      expect(errorText,
          Validator.validate(null, [ValidDateFormat("dd/MM/yyyy", errorText)]));
    });
  });

  group('MinAge test', () {
    const errorText = "You are too young";
    test('calling validate with too young date should return $errorText', () {
      expect(
          errorText,
          Validator.validate(
              "12/03/2008", [MinAge(16, "dd/MM/yyyy", errorText)]));
    });

    test('calling validate with date that is allowed will return null', () {
      expect(
          null,
          Validator.validate(
              "12/03/2006", [MinAge(16, "dd/MM/yyyy", errorText)]));
    });

    test('calling validate with edge date that is allowed will return null',
        () {
      expect(
          null,
          Validator.validate(
              "23/09/2006", [MinAge(16, "dd/MM/yyyy", errorText)]));
    });

    test(
        'calling validate with date that does not match date format will return "Invalid date format"',
        () {
      expect(
          "Invalid date format",
          Validator.validate(
              "12.03.2006", [MinAge(16, "dd/MM/yyyy", errorText)]));
    });
  });

  group('MaxAge test', () {
    const errorText = "You are too old";
    test('calling validate with too old date should return $errorText', () {
      expect(
          errorText,
          Validator.validate(
              "12/03/2008", [MaxAge(13, "dd/MM/yyyy", errorText)]));
    });

    test('calling validate with date that is allowed will return null', () {
      expect(
          null,
          Validator.validate(
              "12/03/2006", [MaxAge(20, "dd/MM/yyyy", errorText)]));
    });

    test('calling validate with edge date that is allowed will return null',
        () {
      expect(
          null,
          Validator.validate(
              "07/01/2006", [MaxAge(17, "dd/MM/yyyy", errorText)]));
    });

    test(
        'calling validate with date that does not match date format will return "Invalid date format"',
        () {
      expect(
          "Invalid date format",
          Validator.validate(
              "12.03.2006", [MaxAge(16, "dd/MM/yyyy", errorText)]));
    });
  });

  group('Multiple validator test', () {
    test(
        'calling validate with value that does match Required but not MinLength will return MinLength error message',
        () {
      expect(
          "Invalid minimal length",
          Validator.validate("mat", [
            Required("Input is required"),
            MinLength(5, "Invalid minimal length")
          ]));
    });

    test(
        'calling validate with value that does match Required and MinLength will return null',
        () {
      expect(
          null,
          Validator.validate("matej", [
            Required("Input is required"),
            MinLength(5, "Invalid minimal length")
          ]));
    });

    test(
        'calling validate with value that does not match Required and MinLength will return Required error message',
        () {
      expect(
          "Input is required",
          Validator.validate("", [
            Required("Input is required"),
            MinLength(5, "Invalid minimal length")
          ]));
    });
  });
}
