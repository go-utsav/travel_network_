import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class mylistview extends StatefulWidget {
  @override
  _mylistviewState createState() => _mylistviewState();
}

class _mylistviewState extends State<mylistview> {
  List<dynamic> _data = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    try {
      Response response =
          await Dio().get('http://chat.vagatrip.com/data/hobby/list');
      setState(() {
        _data = response.data;
        print(_data.toString());
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dio ListView Demo'),
      ),
      body: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_data[index]['data.hobby_name']),
            subtitle: Text(_data[index]['data.priority']),
          );
        },
      ),
    );
  }
}
