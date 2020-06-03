import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String preset;
  final String hint;
  final double padding;
  final TextInputType keyboardType;
  final bool obscureText;
  final Function onChangedCallback;
  CustomTextField({
    this.preset,
    this.hint,
    this.padding,
    this.keyboardType,
    this.obscureText = false,
    this.onChangedCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: padding),
      child: TextField(
        obscureText: obscureText,
        style: TextStyle(color: Colors.blue, fontSize: 17.0),
        keyboardType: keyboardType ?? TextInputType.text,
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
            hintText: preset,
            hintStyle: TextStyle(color: Colors.blue, fontSize: 17.0),
            suffixText: hint,
            suffixStyle: TextStyle(color: Colors.blue, fontSize: 17.0),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(24.0)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey[50]),
                borderRadius: BorderRadius.circular(24.0))),
        onChanged: onChangedCallback,
      ),
    );
  }
}
