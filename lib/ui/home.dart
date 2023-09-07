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
          _buildButtons(buttonName: "."),
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
        if(buttonName == "+" || buttonName == "-" || buttonName == "*" || buttonName == "/" || buttonName == "%" || buttonName == "C"){
          functionalities.operator = buttonName;
        }
        else if(functionalities.operator == ""){
          functionalities.firstNumbers += buttonName;
        }
        else if(functionalities.operator != "" && buttonName != "="){
          functionalities.secondNumbers += buttonName;
        }
        else if(buttonName == "=" && functionalities.firstNumbers != "" && functionalities.secondNumbers != "" && functionalities.operator != ""){
          functionalities.result = functionalities.calculate();
          functionalities.allResults.add(functionalities.result);
        }
        else if(buttonName == "<=" && functionalities.firstNumbers.isNotEmpty){
          String newFirst = functionalities.firstNumbers.substring(0, functionalities.firstNumbers.length - 1);
          functionalities.firstNumbers = newFirst.toString();

        }
    }),
      onLongPress: () => setState(() {
        if(buttonName == "C"){
          functionalities.allResults = [];
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
          height: 100.0,
        child: SingleChildScrollView(
          child: Column(
              children: [
            Row(// Линия для отображения кнопок
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(child: Text(_screenDisplay(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                     ),
                   ),
                 ),
              ]),
            Row(// Линия для отображения кнопок
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(child:
                Text(
                    functionalities.result.toString(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold)))
                ]),
                Row(// Линия для отображения кнопок
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(child:
                      Text(
                          getAllResults().toString(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold)))
                    ]),
            ]
          ),
        )
      )
    );
  }

  String _screenDisplay() {
     if(functionalities.operator == "C"){
       return "${functionalities.firstNumbers = ""} ${functionalities.operator = ""} ${functionalities.secondNumbers = ""} ${functionalities.result = ""}";
    }
    else{
       return "${functionalities.firstNumbers} ${functionalities.operator} ${functionalities.secondNumbers}";
    }
  }
  List<String> getAllResults(){
    return functionalities.allResults;
  }
}
class Functionalities{
  late String firstNumbers = "";
  late String secondNumbers = "";
  late String operator = "";
  late String result = "";
  List<String> allResults = [];

  String calculate(){
    try {
      if(firstNumbers.isNotEmpty && secondNumbers.isNotEmpty){
        if(firstNumbers.contains(".") || secondNumbers.contains(".")){
          double firstInput = double.parse(firstNumbers);
          double secondInput = double.parse(secondNumbers);

          switch (operator) {
            case "+":
              return (firstInput + secondInput).toString();
            case "-":
              return (firstInput - secondInput).toString();
            case "*":
              return (firstInput * secondInput).toString();
            case "/":
              return (firstInput / secondInput).toString();
            case "%":
              return (firstInput % secondInput).toString();
            case "=":
              return "";
            default:
              return "";
          }
        }
        else{
          int firstInput = int.parse(firstNumbers);
          int secondInput = int.parse(secondNumbers);

          switch (operator) {
            case "+":
              return (firstInput + secondInput).toString();
            case "-":
              return (firstInput - secondInput).toString();
            case "*":
              return (firstInput * secondInput).toString();
            case "/":
              return (firstInput / secondInput).toString();
            case "%":
              return (firstInput % secondInput).toString();
            case "=":
              return "";
            default:
              return "";
          }
        }
      }
      else{
        return "";
      }
    }
    catch (e) {
      // Обработка ошибки парсинга
      return "Ошибка при вычислениях: $e";
    }
  }
}

