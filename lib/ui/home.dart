import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Functionalities functionalities = Functionalities();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent.shade200,
        title: const Align(
        alignment: Alignment.center,
        child: Text(
          'Calculator',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold)))),
      backgroundColor: Colors.white,
      body: Column(children: [
        Screen(functionalities: functionalities),
        const SizedBox(width: 8),
        _buttonDesign()
      ]));
  }
 Padding _buttonDesign() => Padding(padding: const EdgeInsets.all(24),
    child: SizedBox(width: 350.0, height: 500.0,
      child: Column(children: [
        const Spacer(),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          _buildButtons(buttonName: "C"),
          _buildButtons(buttonName: "%"),
          _buildButtons(buttonName: "<="),
          _buildButtons(buttonName: "/"),
        ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          _buildButtons(buttonName: "7"),
          _buildButtons(buttonName: "8"),
          _buildButtons(buttonName: "9"),
          _buildButtons(buttonName: "*"),
        ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          _buildButtons(buttonName: "4"),
          _buildButtons(buttonName: "5"),
          _buildButtons(buttonName: "6"),
          _buildButtons(buttonName: "-"),
        ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          _buildButtons(buttonName: "1"),
          _buildButtons(buttonName: "2"),
          _buildButtons(buttonName: "3"),
          _buildButtons(buttonName: "+"),
        ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          _buildButtons(buttonName: "00"),
          _buildButtons(buttonName: "0"),
          _buildButtons(buttonName: ","),
          _buildButtons(buttonName: "="),
        ],
        ),
      ],
      ),
    ),
  );

 Widget _buildButtons({required String buttonName}) => Padding(
    padding: const EdgeInsets.all(3.0),
    child: ElevatedButton(
      onPressed: () => setState(() {
      var value = double.tryParse(buttonName);
      if(value == null){
        functionalities.operator = buttonName;
      }
      else if(functionalities.firstNumbers == 0){
        functionalities.firstNumbers = value;
      }
      else if(functionalities.secondNumbers == 0){
        functionalities.secondNumbers = value;
      }
    }),
      child: Text(buttonName,
        style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold
        ),
      ),
    ),
  );
}

class Screen extends StatelessWidget{
  final Functionalities functionalities;

  const Screen({super.key, required this.functionalities});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          width: 350.0,
          height: 75.0,
        child: Column(children: [
          Row(// Линия для отображения кнопок
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(_screenDisplay(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ]),
          Row(// Линия для отображения кнопок
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                  _result(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold))])
          ]
        )
      )
    );
  }

  String _screenDisplay() {
     if(functionalities.operator == "C"){
       return "${functionalities.firstNumbers = 0} ${functionalities.operator = " "} ${functionalities.secondNumbers = 0}";
    }
    else{
       return "${functionalities.firstNumbers} ${functionalities.operator} ${functionalities.secondNumbers}";
    }
  }

  String _result() {
      return "= ${functionalities.calculate()}";
  }
}
class Functionalities{
  late double firstNumbers = 0;
  late double secondNumbers = 0;
  late String operator = '';

  String calculate(){
    switch(operator){
      case "+": return (firstNumbers + secondNumbers).toString();
      case "-": return (firstNumbers - secondNumbers).toString();
      case "*": return (firstNumbers * secondNumbers).toString();
      case "/": return (firstNumbers / secondNumbers).toString();
      case "%": return (firstNumbers % secondNumbers).toString();
      default: return "";
    }
  }
}

