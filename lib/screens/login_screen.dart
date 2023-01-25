import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/textfield.dart';
import '../components/mybutton.dart';
import '../components/sign_up_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'forgotPasswordPage.dart';
import '../newusers/register_screen.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback showLoginPage;
  LoginScreen({required this.showLoginPage});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userName = TextEditingController();

  final password = TextEditingController();

  // user sign in
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userName.text.trim(), password: password.text.trim());
  }

  @override
  void disponse() {
    userName.dispose();
    password.dispose();
    super.dispose();
  }

  // void registerNewUser() {
  //   Navigator.of(context)
  //       .push(MaterialPageRoute(builder: ((context) => RegisterNewUser())));
  // }

  // bool showDialog(){
  //   return
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                // logo
                const Icon(
                  Icons.lock,
                  size: 80,
                ),
                const SizedBox(
                  height: 20,
                ),

                // greeting text
                Text(
                  'Welcome to our app',
                  style: GoogleFonts.bebasNeue(fontSize: 30),
                ),
                const SizedBox(
                  height: 30,
                ),

                //username reg
                TextFieldValues(
                  controller: userName,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(
                  height: 10,
                ),

                // password
                TextFieldValues(
                  controller: password,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                // forgot password
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    alignment: Alignment.bottomRight,
                    width: double.infinity,
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => ForgotPasswordPage()))),
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(color: Colors.blue),
                      ),
                    )),
                const SizedBox(
                  height: 30,
                ),

                // sign
                // Row(
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.only(left: 10.0),
                //       child: ElevatedButton(
                //         style: ElevatedButton.styleFrom(
                //             backgroundColor: Colors.black,
                //             shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(18))),
                //         onPressed: signIn?MyButton(
                //   onTapVal: signIn,
                // ),

                //         child: const Text(
                //           'Sign in',
                //           style: TextStyle(
                //               fontSize: 20,
                //               color: Colors.white,
                //               fontWeight: FontWeight.bold),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                MyButton(
                  onTapVal: signIn,
                ),

                // register
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account?'),
                    const SizedBox(
                      width: 5,
                    ),
                    SignUpButton(
                      register: widget.showLoginPage,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
