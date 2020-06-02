import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";
  String newOutput = "0";
  int num1 = 0;
  int num2 = 0;
  String operand = "";

  buttonPressed(String number){
    print(number);
if(number =="CLEAR"){
   newOutput = "0";
   num1 = 0;
   num2 = 0;
   operand = "";
  output ="0";
} else if(number =="+" || number =="-"){
   num1 = int.parse(output);
   operand = number;
   newOutput = "0";

}else if(number == "="){
  num2 = int.parse(output);
  if(operand =="+"){
    newOutput = (num1+num2).toString();

  }else if(operand =="-"){
    newOutput = (num1-num2).toString();
  }
  num1 = 0;
  num2 = 0;
  operand = "";

}else{
  newOutput = newOutput + number;
}
print(newOutput);
setState(() {
  output = newOutput;
});
  }

  buildButton(String num) {
    return new Expanded(
      child: new MaterialButton(
        padding: new EdgeInsets.all(24.0),
        child: new Text(
          num,
          style: new TextStyle(fontSize: 25.0),
        ),
        onPressed: () =>
          buttonPressed(num)
        ,
        color: Colors.white,
        textColor: Colors.black54,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            Container(

                padding: new EdgeInsets.symmetric(
                  vertical: 24.0,
                  horizontal: 12.0,
                ),
                alignment: Alignment.centerRight,
                margin: new EdgeInsets.symmetric(
                  vertical: 24
                ),
                child: new Text(
                  output,
                  style: new TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            new Expanded(child: new Divider()),
            new Column(children: [
              new Row(
                children: [
                  buildButton("9"),
                  buildButton("+"),
                  buildButton("-"),
                ],
              ),
              new Row(
                children: [
                  buildButton("6"),
                  buildButton("7"),
                  buildButton("8"),
                ],
              ),
              new Row(
                children: [
                  buildButton("3"),
                  buildButton("4"),
                  buildButton("5"),
                ],
              ),
              new Row(
                children: [
                  buildButton("0"),
                  buildButton("1"),
                  buildButton("2"),
                ],
              ),
              new Row(
                children: [
                  buildButton("CLEAR"),
                  buildButton("="),
                ],
              ),
            ])
          ],
        ),
      ),
    );
  }
}
