import '../components/newRegFields.dart';
import 'package:flutter/material.dart';
import '../screens/login_screen.dart';

class RegisterNewUser extends StatefulWidget {
  final VoidCallback showLoginPage;

  RegisterNewUser({required this.showLoginPage});
  @override
  State<RegisterNewUser> createState() => _RegisterNewUserState();
}

class _RegisterNewUserState extends State<RegisterNewUser> {
  String dropdownvalue = 'Student';

  // List of items in our dropdown menu

  var items = [
    'Student',
    'Facluty',
    'Alummi',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: (() {
                  Navigator.of(context).pop();
                }),
                icon: const Icon(Icons.arrow_back_ios_new)),
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  DropdownButton(
                    // Initial Value
                    value: dropdownvalue,
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),
                    // Array list of items
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((context) =>
                                      NewRegTextField(items.toString()))));
                            },
                            child: Text(
                              items,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
