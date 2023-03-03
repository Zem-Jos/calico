import 'package:flutter/material.dart';

typedef StringCallback = String Function(String?);

class TextInput extends StatelessWidget {
  final TextEditingController textController;
  final String label;
  final StringCallback? validationCallback;

  const TextInput(
      {Key? key,
      required this.textController,
      required this.label,
      this.validationCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0x1AE0A071),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: Color(0xffE0A071),
        ),
      ),
      // Email or Phone Number
      child: TextFormField(
        controller: textController,
        decoration: InputDecoration(
          labelText: label,
        ),
        validator: validationCallback,
      ),
    );
  }
}
