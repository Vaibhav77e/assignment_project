import '../components/mybutton.dart';
import '../screens/login_screen.dart';
import 'package:flutter/material.dart';
import './register_screen.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  void toggleScreen() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  Future<void> _showdialog() {
    return showDialog(
        context: context,
        builder: ((owncontext) => AlertDialog(
              title: const Text(
                  'Username is not registered ,please register for benefits'),
              actions: [
                TextButton(
                    onPressed: Navigator.of(context).pop,
                    child: const Text('ok'))
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginScreen(
        showLoginPage: toggleScreen,
      );
    } else {
      return RegisterNewUser(showLoginPage: toggleScreen);
    }
  }
}
