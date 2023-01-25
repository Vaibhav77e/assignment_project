import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  final void Function()? register;
  SignUpButton({this.register});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: register,
      child: Text(
        'Sign Up for free',
        style: TextStyle(color: Colors.blue),
      ),
    );
  }
}
