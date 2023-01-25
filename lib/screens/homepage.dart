import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyHomePage extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              alignment: Alignment.center,
              child: Text('Sign in as: ${user.email!}')),
          ElevatedButton(
              onPressed: () => FirebaseAuth.instance.signOut(),
              child: const Text('Sign Out'))
        ],
      ),
    );
  }
}
