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

  String currentOperation = "";
  String oldOperation = "";

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
          onPressed: (){
            calculate(btnText);
          },
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
          onPressed: (){
            calculate(btnText);
          },
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

  void calculate(txtButton){
    print(txtButton);
    if(txtButton == "C"){
      text = "0";
      num1 = 0;
      num2 = 0;
      result = "0";
      finalResult = "0";
      currentOperation = "";
      oldOperation = "";
    }else if (currentOperation == "=" && txtButton == "="){
      switch(currentOperation){
        case "+":
          finalResult = add();
          break;
        case "-":
          finalResult = sub();
          break;
        case "x":
          finalResult = mult();
          break;
        case "/":
          finalResult = div();
          break;
        case "%":
          finalResult = percent();
          break;
      }
      num1 = 0;
      num2 = 0;
    } else if (txtButton=="+"||txtButton=="-"||txtButton=="x"||txtButton=="/"||txtButton=="%"||txtButton=="="){
      if(num1==0){
        num1 = double.parse(result);
      }else {
        num2 = double.parse(result);
      }
      switch(currentOperation){
        case "+":
          finalResult = add();
          break;
        case "-":
          finalResult = sub();
          break;
        case "x":
          finalResult = mult();
          break;
        case "/":
          finalResult = div();
          break;
        case "%":
          finalResult = percent();
          break;
      }
      result = "";
      currentOperation = txtButton;
      oldOperation = currentOperation;
    }else if (finalResult == "0" && txtButton != "." && txtButton != "+/-") {
      result = txtButton;
      finalResult = result;
    }else if (finalResult.contains(".") && txtButton == "."){
      finalResult = result;
    }else if (txtButton == "+/-"){
      result.startsWith("-")?result=result.substring(1):result="-"+result;
      finalResult = result;
    } else {
      result = result + txtButton;
      finalResult = result;
    }
    setState(() {
      text = finalResult;
    });
  }

  String add(){
    double dResult = num1 + num2;
    result = dResult.toStringAsFixed(dResult.truncateToDouble() == dResult ? 0 : 2);
    //num1 = double.parse(result);
    return result;
  }
  String sub(){
    double dResult = num1 - num2;
    result = dResult.toStringAsFixed(dResult.truncateToDouble() == dResult ? 0 : 2);
    //num1 = double.parse(result);
    return result;
  }
  String mult(){
    double dResult = num1 * num2;
    result = dResult.toStringAsFixed(dResult.truncateToDouble() == dResult ? 0 : 2);
    //num1 = double.parse(result);
    return result;
  }
  String div(){
    double dResult = num1 / num2;
    result = dResult.toStringAsFixed(dResult.truncateToDouble() == dResult ? 0 : 2);
    //num1 = double.parse(result);
    return result;
  }
  String percent(){
    double dResult = (num2/num1)*100;
    result = dResult.toStringAsFixed(dResult.truncateToDouble() == dResult ? 0 : 2);
    //num1 = double.parse(result);
    return result+"%";
  }


}