import 'package:flutter/material.dart';
import 'placeholder_widget.dart';
import 'barcodescanning.dart';

// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'package:nhp1/barcode/barcode.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    PlaceholderWidget(Container(
      child: Text("Items"),
    )),
    BarcodeScanPage(),
    PlaceholderWidget(Container(
      child: Text("Categories"),
    )),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Flutter App'),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.timelapse_outlined,
            ),
            title: Text(
              'Items',
              style: TextStyle(color: Colors.black),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_outlined),
            title: Text('Add Item'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            title: Text('Categories'),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
