import 'package:flutter/material.dart';
import 'package:insta/sign-in.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.audiotrack,
                color: Colors.green,
                size: 250.0,
              ),
              SizedBox(height: 40),
              Text(
                'Travel Network',
                style: TextStyle(
                  fontSize: 48.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const signUpScreen()),
                  );
                },
                child: Text(
                  'Lets Get Started',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green,
            tooltip: 'Increment',
            child: Text('>'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const signUpScreen()),
              );
            }),
      ),
    );
  }
}
