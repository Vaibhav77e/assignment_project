import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../newusers/studentTextfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

class NewRegTextField extends StatefulWidget {
  final String text;
  NewRegTextField(this.text);

  @override
  State<NewRegTextField> createState() => _NewRegTextFieldState();
}

class _NewRegTextFieldState extends State<NewRegTextField> {
  // Selects image from camera or gallery
  XFile? _imageFile;
// create inatance of imagepicker
  final ImagePicker _picker = ImagePicker();

  final userType = TextEditingController();
  final userEmail = TextEditingController();
  final userPassword = TextEditingController();
  final confirmPassword = TextEditingController();
  final year = TextEditingController();
  final clg = TextEditingController();

  @override
  void dispose() {
    userEmail.dispose();
    userPassword.dispose();
    confirmPassword.dispose();
    clg.dispose();
    super.dispose();
  }

  // final VoidCallback showLoginPage;
  Future register() async {
    if (userPasswordCheck()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: userEmail.text.trim(), password: userPassword.text.trim());
    }
  }

  bool userPasswordCheck() {
    if (userPassword.text.trim() == confirmPassword.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

// Profile builder
  Widget buildProfile() {
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 60,
          backgroundImage: _imageFile == null
              ? const AssetImage("assets/profile-user.png")
              : FileImage(File(_imageFile!.path)) as ImageProvider,
        ),
        Positioned(
            bottom: 20,
            right: 20,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: ((buildercontext) => buildBottomSheet()));
              },
              child: const Icon(
                Icons.camera_alt,
                color: Colors.purple,
              ),
            ))
      ],
    );
  }

// bottom sheet
  Widget buildBottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(children: [
        Text('Choose Profile Photo',
            style: GoogleFonts.getFont('Merriweather', fontSize: 22)),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                icon: const Icon(
                  Icons.camera,
                  color: Colors.black,
                ),
                label: const Text('Camera')),
            const SizedBox(
              width: 10,
            ),
            TextButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                icon: const Icon(
                  Icons.image,
                  color: Colors.black,
                ),
                label: const Text('Gallery')),
          ],
        )
      ]),
    );
  }

// to choose photo from gallery or camera
  void takePhoto(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);

    setState(() {
      _imageFile = pickedFile as XFile?;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                buildProfile(),
                const SizedBox(
                  height: 20,
                ),
                NewStudentReg(
                    controller: userType,
                    hintText: 'Student',
                    obscureTextVal: false),
                const SizedBox(
                  height: 10,
                ),
                NewStudentReg(
                    controller: userEmail,
                    hintText: 'Email',
                    obscureTextVal: false),
                const SizedBox(
                  height: 10,
                ),
                NewStudentReg(
                    controller: userPassword,
                    hintText: 'Password',
                    obscureTextVal: false),
                const SizedBox(
                  height: 10,
                ),
                NewStudentReg(
                    controller: confirmPassword,
                    hintText: 'Confirm Password',
                    obscureTextVal: true),
                const SizedBox(
                  height: 10,
                ),
                NewStudentReg(
                    controller: clg,
                    hintText: 'Enter your College',
                    obscureTextVal: false),
                const SizedBox(
                  height: 10,
                ),
                NewStudentReg(
                    controller: year,
                    hintText: 'Select the Year in which your studying',
                    obscureTextVal: false),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18))),
                    onPressed: register,
                    child: const Text(
                      'Register',
                      style: TextStyle(fontSize: 20),
                    ))
              ],
            ),
          ),
        )),
      ),
    );
  }
}
