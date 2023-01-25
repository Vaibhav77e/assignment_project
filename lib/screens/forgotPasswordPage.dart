import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailcontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailcontroller.text.trim());
      showDialog(
          context: context,
          builder: ((context) => const AlertDialog(
                content: Text('Password Link has been sent your email'),
              )));
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: ((context) => AlertDialog(
                content: Text(e.message.toString()),
              )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black45),
      body: Column(children: [
        SizedBox(
          height: 20,
        ),
        const Text('Enter your email and we will send you password reset link'),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: emailcontroller,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent)),
                hintText: 'Email',
                fillColor: Colors.grey[200],
                filled: true),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        MaterialButton(
          onPressed: passwordReset,
          child: const Text(
            'Reset Password',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.black54,
        )
      ]),
    );
  }
}
