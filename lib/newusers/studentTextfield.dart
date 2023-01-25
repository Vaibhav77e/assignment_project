import 'package:flutter/material.dart';

class NewStudentReg extends StatelessWidget {
  final controller;
  final String hintText;
  bool obscureTextVal;
  NewStudentReg(
      {required this.controller,
      required this.hintText,
      required this.obscureTextVal});

  @override
  Widget build(BuildContext context) {
    return TextField(
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
      obscureText: obscureTextVal,
    );
  }
}
