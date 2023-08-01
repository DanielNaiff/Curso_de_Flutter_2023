import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Container example"),
        ),
        body: Center(child: Container(
          height: 200,
          width: double.infinity,
          alignment: Alignment.center,
          margin: EdgeInsets.all(25),
          padding: EdgeInsets.all(35),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.orange, width: 3),
          ),
          child: Text("Container",
              style: TextStyle(fontSize: 25)),
        ),
        ),
      ),
    );
  }
}
