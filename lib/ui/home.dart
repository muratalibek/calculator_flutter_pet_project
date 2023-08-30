import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
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
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      ),
      backgroundColor: Colors.white,
      body: const MainClass(),
    );
  }
}

class MainClass extends StatelessWidget{
  const MainClass({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Screen(),
        SizedBox(width: 8),
        ButtonDesign(),
      ],
    );
  }
}

class Screen extends StatelessWidget{
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: SizedBox(width: 350.0, height: 75.0,
        child: Column(children: [
          Row(// Линия для отображения кнопок
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('value',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(// Линия для отображения кнопок
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("= result",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
        ),
      ),
    );
  }
}
class ButtonDesign extends StatelessWidget{

  const ButtonDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(padding: EdgeInsets.all(24),
      child: SizedBox(width: 350.0, height: 500.0,
        child: Column(children: [
          Spacer(),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            BuildButtons(buttonName: "C"),
            BuildButtons(buttonName: "%"),
            BuildButtons(buttonName: "<="),
            BuildButtons(buttonName: "/"),
              ],
            ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            BuildButtons(buttonName: "7"),
            BuildButtons(buttonName: "8"),
            BuildButtons(buttonName: "9"),
            BuildButtons(buttonName: "*"),
              ],
            ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            BuildButtons(buttonName: "4"),
            BuildButtons(buttonName: "5"),
            BuildButtons(buttonName: "6"),
            BuildButtons(buttonName: "-"),
              ],
            ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            BuildButtons(buttonName: "1"),
            BuildButtons(buttonName: "2"),
            BuildButtons(buttonName: "3"),
            BuildButtons(buttonName: "+"),
              ],
            ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            BuildButtons(buttonName: "00"),
            BuildButtons(buttonName: "0"),
            BuildButtons(buttonName: ","),
            BuildButtons(buttonName: "="),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BuildButtons extends StatefulWidget {
  final String buttonName;

  const BuildButtons({Key? key, required this.buttonName}) : super(key: key);

  @override
  _BuildButtonsState createState() => _BuildButtonsState();
}

class _BuildButtonsState extends State<BuildButtons> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ElevatedButton(
        onPressed: () {
          if (kDebugMode) {
            print('pressed ${widget.buttonName}');
          }
        },
        child: Text(
          widget.buttonName,
          style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// class BuildButtons extends StatelessWidget{
//   final String buttonName;
//
//   const BuildButtons({super.key, required this.buttonName});
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(2.0),
//       child: ElevatedButton(onPressed: () => print('pressed'),
//         child: Text(buttonName,
//           style: const TextStyle(
//               fontSize: 20.0,
//               fontWeight: FontWeight.bold
//           ),
//         ),
//       ),
//     );
//   }
// }

// class BuildButtons extends StatefulWidget{
//   final String buttonName;
//   const BuildButtons({super.key, required this.buttonName});
//
//   @override
//   State<StatefulWidget> createState() {
//
//
//   }
// }

class Functionalities{
  late double firstNumbers;
  late double secondNumbers;
  late String operator;

  calculate(){
    switch(operator){
      case "+": return (firstNumbers + secondNumbers);
      case "-": return (firstNumbers - secondNumbers);
      case "*": return (firstNumbers * secondNumbers);
      case "/": return (firstNumbers / secondNumbers);
    }
  }
}

