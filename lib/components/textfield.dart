import 'package:flutter/material.dart';

class TextFieldValues extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  TextFieldValues(
      {required this.controller,
      required this.hintText,
      required this.obscureText});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueAccent)),
            hintText: hintText,
            fillColor: Colors.grey[100],
            filled: true),
        obscureText: obscureText,
      ),
    );
  }
}
