import 'package:flutter/material.dart';
import 'package:flutter_calculator/calculator.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My First Calculator",
      home: Scaffold(
          appBar: AppBar(
            title: Text("My Calculator"),
          ),
          body:  Center(
            child: Calculator(),
          )
      ),
    );
  }



}