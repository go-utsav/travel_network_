import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:insta/listview.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();

  static fromJson(itemJson) {}
}

class _dashboardState extends State<dashboard> {
  void listview() async {
    try {
      final response =
          await http.get(Uri.parse('https://reqres.in/api/unknown'));
      final json = jsonDecode(response.body);
      final items = List<dashboard>.from(
          json.map((itemJson) => dashboard.fromJson(itemJson)));
      setState(() {
        // response = items;
      });

      if (response.statusCode == 200) {
        var data = json.decode(response.body.toString());
        print(data);
      } else {
        print('erorr in api ');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('this is dashboard page'),
              SizedBox(height: 25),
              GestureDetector(
                  onTap: () {
                    listview();
                  },
                  child: Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text('Register'),
                    ),
                  ))
            ],
          )),
      floatingActionButton: FloatingActionButton(
          tooltip: 'Increment',
          child: Text('>'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => mylistview()),
            );
          }),
    );
  }
}
