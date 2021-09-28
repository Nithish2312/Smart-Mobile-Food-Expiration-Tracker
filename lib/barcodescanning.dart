import 'package:nhp1/main.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'button_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:date_field/date_field.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class BarcodeScanPage extends StatefulWidget {
  @override
  _BarcodeScanPageState createState() => _BarcodeScanPageState();
}

class _BarcodeScanPageState extends State<BarcodeScanPage> {
  String barcode = '';
  String name = '';
  String category = '';
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  String quantity = '';
  final format = DateFormat("yyyy-MM-dd");

  CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ButtonWidget(
                text: 'Start Barcode scan',
                onClicked: scanBarcode,
              ),
              SizedBox(height: 20),
              Text("Bar Code Number",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              TextField(
                decoration: InputDecoration(hintText: barcode),
              ),
              Text("Name of Product",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              TextField(
                onChanged: (value) {
                  name = value;
                },
                decoration: InputDecoration(hintText: 'Enter the name'),
              ),
              Text("Category",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              TextField(
                onChanged: (value) {
                  category = value;
                },
                decoration: InputDecoration(hintText: 'Enter the category'),
              ),
              Text("Quantity",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              TextField(
                onChanged: (value) {
                  quantity = value;
                },
                decoration: InputDecoration(hintText: 'Enter the quantity'),
              ),
              Text("Date and Time",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              DateTimeField(
                  decoration: const InputDecoration(
                      hintText: 'Please select the expiry date'),
                  selectedDate: endDate,
                  onDateSelected: (DateTime value) {
                    setState(() {
                      endDate = value;
                    });
                  }),

              // DateTimeField(
              //   format: format,
              //   onShowPicker: (context, currentValue) {
              //     showDatePicker(
              //         context: context,
              //         firstDate: DateTime(1900),
              //         initialDate: currentValue ?? DateTime.now(),
              //         lastDate: DateTime(2100));
              //     startDate = currentValue;
              //   },
              // ),
              // Text(
              //   '$barcode',
              //   style: TextStyle(
              //     fontSize: 28,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.black,
              //   ),
              // ),
              // SizedBox(height: 72),
              // Text(
              //   'Scan Result',
              //   style: TextStyle(
              //     fontSize: 16,
              //     color: Colors.black,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              ElevatedButton(
                child: Text('Submit'),
                onPressed: () async {
                  await products.add({
                    'Barcode': barcode,
                    'Name': name,
                    'Category': category,
                    'Quantity': quantity,
                    'Start': startDate,
                    'End': endDate,
                  });
                  _onAlertWithCustomImagePressed(context);
                },
              )
            ],
          ),
        ),
      );

  Future<void> scanBarcode() async {
    try {
      final barcode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.BARCODE,
      );

      if (!mounted) return;

      setState(() {
        this.barcode = barcode;
      });
    } on PlatformException {
      barcode = 'Failed to get platform version.';
    }
  }
}

_onAlertWithCustomImagePressed(context) {
  Alert(
    context: context,
    title: "Product Added",
    image: Image.asset("assets\success.png"),
  ).show();
}
