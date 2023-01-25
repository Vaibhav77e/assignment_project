import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTapVal;
  MyButton({this.onTapVal});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapVal,
      child: Container(
          padding: const EdgeInsets.all(25),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(10)),
          child: const Center(
            child: Text(
              'Sign in',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          )),
    );
  }
}
