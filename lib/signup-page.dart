import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:insta/dashboard.dart';

class signUpPage extends StatefulWidget {
  const signUpPage({super.key});

  @override
  State<signUpPage> createState() => _signUpPageState();
}

class _signUpPageState extends State<signUpPage> {
//declaring controllers

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  void signup(String firstname, lastname, email, password, mobile) async {
    try {
      final response = await http
          .post(Uri.parse('http://192.168.1.10:9090/app/signup'), body: {
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "password": password,
        "mobileno": mobile
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        print('\n\nRegistered successfully');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const dashboard()),
        );
      } else {
        print('Failed to register');
      }
    } catch (e) {
      print(e.toString());
      print('unable to connect');
    }
  }

// API integration steps

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Account'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Create your Travel Network Account Now'),
            SizedBox(height: 50),
            Flexible(
              child: TextFormField(
                controller: firstnameController,
                decoration: InputDecoration(hintText: 'First Name'),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: lastnameController,
              decoration: InputDecoration(hintText: 'Last Name'),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(hintText: 'Email'),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: mobileController,
              decoration: InputDecoration(hintText: 'Mobile No.'),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(hintText: 'Password'),
            ),
            SizedBox(height: 25),
            GestureDetector(
              onTap: () {
                signup(
                  firstnameController.text.toString(),
                  lastnameController.text.toString(),
                  emailController.text.toString(),
                  mobileController.text.toString(),
                  passwordController.text.toString(),
                );
              },
              child: Container(
                height: 50.0,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text('Sign Up'),
                ),
              ),
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: 'Increment',
          child: Text('D'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const dashboard()),
            );
          }),
    );
  }
}
