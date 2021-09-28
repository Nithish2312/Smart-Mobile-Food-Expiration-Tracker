import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "NHP",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          child: Text("Hello World"),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
