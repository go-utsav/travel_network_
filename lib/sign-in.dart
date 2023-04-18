// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dashboard.dart';
import 'signup-page.dart';

class signUpScreen extends StatefulWidget {
  const signUpScreen({super.key});

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email, password) async {
    try {
      Response response = await post(Uri.parse('https://reqres.in/api/login'),
          body: {'email': email, 'password': password});

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        print('Login successfully');

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const dashboard()),
        );
      } else {
        print('failed to login');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login API'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          c
            children: [
              TextFormField(
                controller: emailController,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(hintText: 'Email'),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(hintText: 'password'),
              ),
              SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  login(emailController.text.toString(),
                      passwordController.text.toString());
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text('Sign In'),
                  ),
                ),
              ),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: 'Increment',
          child: Text('>'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const signUpPage()),
            );
          }),
    );
  }
}
