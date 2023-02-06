import 'package:flutter/material.dart';

class FormLoginValidate extends StatefulWidget {
  const FormLoginValidate({Key? key}) : super(key: key);

  @override
  State<FormLoginValidate> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLoginValidate> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter some text BAI";
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Data is null')),
                );
              }
            },
            child: const Text("VALIDATE"),
          ),
        ],
      ),
    );
  }
}
