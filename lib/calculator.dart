import 'package:flutter/material.dart';

class Calculator extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return CalculatorState();
  }

}

class CalculatorState extends State<Calculator>{

  String text = "0";
  double num1 = 0;
  double num2 = 0;

  String result = "0";
  String finalResult = "0";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 9),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(//top operation and result text
            children: <Widget>[
              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 60,
                      fontStyle: FontStyle.normal
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              button("C", Colors.white, Colors.blueAccent),
              button("+/-", Colors.white, Colors.blueAccent),
              button("%", Colors.white, Colors.blueAccent),
              button("/", Colors.white, Colors.blueAccent),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              button("7", Colors.black, Colors.white10),
              button("8", Colors.black, Colors.white10),
              button("9", Colors.black, Colors.white10),
              button("x", Colors.white, Colors.blueAccent),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              button("4", Colors.black, Colors.white10),
              button("5", Colors.black, Colors.white10),
              button("6", Colors.black, Colors.white10),
              button("-", Colors.white, Colors.blueAccent),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              button("1", Colors.black, Colors.white10),
              button("2", Colors.black, Colors.white10),
              button("3", Colors.black, Colors.white10),
              button("+", Colors.white, Colors.blueAccent),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              button("0", Colors.black, Colors.white10),
              button(".", Colors.black, Colors.white10),
              button("=", Colors.white, Colors.blueAccent),
            ],
          )
        ],
      ),
    );
  }

  Widget button(String btnText, Color btnTextColor, Color btnColor){
    Container container;
    if (btnText == "0"){
      container = Container(
        padding: EdgeInsets.all(5),
        child: RaisedButton(
          onPressed: (){},
          child: Text(
            btnText,
            style: TextStyle(
                fontSize: 30,
                color: btnTextColor
            ),
          ),
          padding: EdgeInsets.only(left: 83, right: 83, top: 15, bottom: 15),
          color: btnColor,
          shape: StadiumBorder(),
        ),
      );
    }else {
      container = Container(
        padding: EdgeInsets.all(5),
        child: RaisedButton(
          onPressed: (){},
          child: Text(
            btnText,
            style: TextStyle(
                fontSize: 30,
                color: btnTextColor
            ),
          ),
          padding: EdgeInsets.all(20),
          color: btnColor,
          shape: CircleBorder(),
        ),
      );
    }
    return container ;
  }

}