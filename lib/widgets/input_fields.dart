import 'package:flutter/material.dart';

class InputFielsW extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPas;
  final String hintText;
  final TextInputType textInputType;

  InputFielsW({
    Key? key,
    required this.textEditingController,
    this.isPas = false,
    required this.hintText,
    required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        contentPadding: EdgeInsets.all(8),
      ),
      keyboardType: textInputType,
      obscureText: isPas,
    );
  }
}
