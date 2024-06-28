import 'package:ems/Database/helper.dart';
import 'package:ems/Screens/signin_screen.dart';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String? _selectedRole;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signUp() async  {
    String fullName = _fullNameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    // Now you have the values and can use them as needed
    print('Full Name: $fullName');
    print('Email: $email');
    print('Password: $password');

    int userId = await DatabaseHelper.instance.insertUser(fullName, email, password, _selectedRole!);
    print('Inserted user with ID: $userId');

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Signin()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [Color(0xFFFF9966), Color(0xFFFF9966), Color(0xFFFF9966)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 80,
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Signup",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Enter your credentials",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: <Widget>[
                            TextField(
                              controller: _fullNameController,
                              style: const TextStyle(
                                color: Color(0xFFF444444),
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                              ),
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.person,
                                  size: 20,
                                  color: Color(0xFFFF888888),
                                ),
                                hintText: "Enter your full name",
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.normal,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 30),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: const BorderSide(
                                      color: Color(0xFFF5F5F5)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: const BorderSide(
                                      color: Color(0xFFF5F5F5)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              controller: _emailController,
                              style: const TextStyle(
                                color: Color(0xFFF444444),
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                              ),
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.email,
                                  size: 20,
                                  color: Color(0xFFFF888888),
                                ),
                                hintText: "Enter your email address",
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.normal,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 30),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      color: Color(0xFFF5F5F5)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      color: Color(0xFFF5F5F5)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              controller: _passwordController,
                              style: const TextStyle(
                                color: Color(0xFFF444444),
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                              ),
                              obscureText: true,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.password,
                                  size: 20,
                                  color: Color(0xFFFF888888),
                                ),
                                hintText: "Enter your password",
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.normal,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 30),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      color: Color(0xFFF5F5F5)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      color: Color(0xFFF5F5F5)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        DropdownButtonFormField<String>(
                          style: const TextStyle(
                            color: Color(0xFFF444444),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                          value: _selectedRole,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.person,
                              size: 20,
                              color: Color(0xFFFF888888),
                            ),
                            hintText: "Select your role",
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.normal,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 30),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide:
                                  const BorderSide(color: Color(0xFFF5F5F5)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide:
                                  const BorderSide(color: Color(0xFFF5F5F5)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(color: Colors.blue),
                            ),
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedRole = newValue;
                            });
                          },
                          items: <String>['HR', 'Admin', 'CEO']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _signUp,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFF9966),
                              padding: const EdgeInsets.symmetric(
                                vertical: 15,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
