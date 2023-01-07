import 'package:flutter/material.dart';
import 'package:simple_form_validator/simple_form_validator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Required, MaxLength check',
            ),
            validator: (value) {
              return Validator.validate(value, [
                Required("Input required"),
                MaxLength(4, "Invalid maximum length")
              ]);
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Required, ValidDateFormat, MaxAge and MinLength check',
            ),
            validator: (value) {
              return Validator.validate(value, [
                Required("Input is required"),
                ValidDateFormat("dd/MM/yyyy", "Invalid date format"),
                MaxAge(15, "dd/MM/yyyy", "You are too old"),
                MinLength(2, "Invalid minimum length")
              ]);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
