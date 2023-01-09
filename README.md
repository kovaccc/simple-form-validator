# simple_form_validator

[![GitHub](https://img.shields.io/github/license/kovaccc/simple-form-validator)](https://github.com/kovaccc/simple-form-validator/blob/main/LICENSE)

Package for simple validation of flutter form fields.

* Only one dependency of [intl](https://pub.dev/packages/intl) package (required for age validation)
* Open source
* Extensible
* Test coverage 100%

## Example

```dart
  TextFormField
(
  validator: (value) {
    return Validator.validate(value, [
      Required("Input is required"),
      ValidDateFormat("dd/MM/yyyy", "Invalid date format"),
      MaxAge(15, "dd/MM/yyyy", "You are too old"),
      MinLength(2, "Invalid minimum length")
    ]);
  },
)
```

## Getting Started

### Installation

Add `simple_form_validator` as dependency to your flutter project by adding this lines
to `pubspec.yaml`.

```yaml
dependencies:
  simple_form_validator: "0.1.4"
```

Then run `flutter pub get` to install required dependencies.

<small>Check [installation](https://pub.dev/packages/simple_form_validator/install) tab for more information</small>

### Code

Import `simple_form_validator` package to your dart widgets by writing:

```dart
import 'package:simple_form_validator/simple_form_validator.dart';
```

Now you can use Validator class to create validation logic. Here is simple validator that validates
if input is not null or empty.

```dart

final invalidInput = Validator.validate("", [
  Required("Input is required"),
]);

final validInput = Validator.validate("ma", [
  Required("Input is required"),
]);

print(invalidInput); // Input is required

print(validInput); // null, means input is valid
```

## Validation types

### `ValidationType(String errorMessage)`

General class that all validation types need to extend. Error message `errorMessage` that is returned if input
value doesn't satisfy condition of validation type.

### `MaxAge(int maxYears, String dateFormat, String errorMessage)`

Validates if given date is younger than `maxYears`. It will also return error message if date format
of input incorrect.

### `MinAge(int minYears, String dateFormat, String errorMessage)`

Validates if given date is older than `minYears`. It will also return error message if date format
of input is incorrect.

### `MaxLength(int length, String errorMessage)`

Validates if given input length is equal or smaller than `length`.

### `MinLength(int length, String errorMessage)`

Validates if given input length is equal or larger than `length`.

### `Regex(String expression, String errorMessage)`

Validates if given input value matches pattern `expression`.

### `Required(String expression, String errorMessage)`

Validates if given input value is not null or empty.

### `ValidDateFormat(String dateFormat, String errorMessage)`

Validates if given input date matches `dateFormat`.

### `Validator`

Class contains most important method for validation `validate`. If you have different validation
types given to this method it will return error message of first validation type that input value
does not satisfy.

Example:

```dart
 test
('calling validate with value that does match Required but not MinLength will return MinLength error message',
() {
  expect(
        "Invalid minimal length",
        Validator.validate("mat", [
          Required("Input is required"),
          MinLength(5, "Invalid minimal length")
  ]));
});

test
('calling validate with value that does match Required and MinLength will return null',
() {
  expect(
        null,
        Validator.validate("matej", [
        Required("Input is required"),
        MinLength(5, "Invalid minimal length")
  ]));
});
```
## Notes

### Extending `ValidationType`

You can extend `ValidationType` if you need to define and validate some other validation type.

```dart
class CustomValidationType extends ValidationType {
  CustomValidationType(super.errorMessage);

  @override
  bool isValid(String? inputValue) {
    // TODO implement validation condition
  }
}
```

## Support

If you would like to support this library you can suggest some other validation type that is not yet implemented.
