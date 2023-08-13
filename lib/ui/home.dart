import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    final style = ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        foregroundColor: MaterialStateProperty.all(Colors.black),
        padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
        minimumSize: MaterialStateProperty.all(const Size(60, 60)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
                side: const BorderSide(color: Colors.red)
            )
        )
    );
    // String _output = '0';
    // String _currentInput = '';
    // String _operator = '';
    // double _num1 = 0;
    // double _num2 = 0;

    final List<String> buttons = [
      'C',
      '%',
      'DEL',
      '/',
      '7',
      '8',
      '9',
      'X',
      '4',
      '5',
      '6',
      '-',
      '1',
      '2',
      '3',
      '+',
      '00',
      '0',
      ',',
      '='
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.center,
          child: Text('Calculator'),
        ),
        backgroundColor: Colors.redAccent.shade200,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(flex: 150),
            Row(// Линия для отображения кнопок
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(value.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Spacer(flex: 20),
          const Row(// Линия для отображения кнопок
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("=",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Spacer(flex: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: style,
                onPressed: () {},
                child: Text(buttons[0],
                  style: const TextStyle(fontSize: 30.0),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                style: style,
                onPressed: () {},
                child: Text(buttons[1],
                  style: const TextStyle(fontSize: 30.0),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                style: style,
                onPressed: () {},
                child: Text(buttons[2],
                  style: const TextStyle(fontSize: 30.0),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                style: style,
                onPressed: () {},
                child: Text(buttons[3],
                  style: const TextStyle(fontSize: 30.0),
                ),
              ),
              const SizedBox(width: 50)
            ],
          ),
          const Spacer(flex: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: style,
                onPressed: () {
                  setState(() {
                    value = 7;
                  });
                },
                child: Text(buttons[4],
                  style: const TextStyle(fontSize: 30.0),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                style: style,
                onPressed: () {setState(() {
                  value = 8;
                });},
                child: Text(buttons[5],
                  style: const TextStyle(fontSize: 30.0),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                style: style,
                onPressed: () {setState(() {
                  value = 9;
                });},
                child: Text(buttons[6],
                  style: const TextStyle(fontSize: 30.0),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                style: style,
                onPressed: () {},
                child: Text(buttons[7],
                  style: const TextStyle(fontSize: 30.0),
                ),
              ),
              const SizedBox(width: 50)
            ],
          ),
          const Spacer(flex: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: style,
                onPressed: () {setState(() {
                  value = 4;
                });},
                child: Text(buttons[8],
                  style: const TextStyle(fontSize: 30.0),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                style: style,
                onPressed: () {setState(() {
                  value = 5;
                });},
                child: Text(buttons[9],
                  style: const TextStyle(fontSize: 30.0),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                style: style,
                onPressed: () {setState(() {
                  value = 6;
                });},
                child: Text(buttons[10],
                  style: const TextStyle(fontSize: 30.0),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                style: style,
                onPressed: () {},
                child: Text(buttons[11],
                  style: const TextStyle(fontSize: 30.0),
                ),
              ),
              const SizedBox(width: 50)
            ],
          ),
          const Spacer(flex: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: style,
                onPressed: () {setState(() {
                  value = 1;
                });},
                child: Text(buttons[12],
                  style: const TextStyle(fontSize: 30.0),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                style: style,
                onPressed: () {setState(() {
                  value = 2;
                });},
                child: Text(buttons[13],
                  style: const TextStyle(fontSize: 30.0),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                style: style,
                onPressed: () {setState(() {
                  value = 3;
                });},
                child: Text(buttons[14],
                  style: const TextStyle(fontSize: 30.0),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                style: style,
                onPressed: () {},
                child: Text(buttons[15],
                  style: const TextStyle(fontSize: 30.0),
                ),
              ),
              const SizedBox(width: 50)
            ],
          ),
          const Spacer(flex: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: style,
                onPressed: () {},
                child: Text(buttons[16],
                  style: const TextStyle(fontSize: 30.0),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                style: style,
                onPressed: () {setState(() {
                  value = 0;
                });},
                child: Text(buttons[17],
                  style: const TextStyle(fontSize: 30.0),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                style: style,
                onPressed: () {},
                child: Text(buttons[18],
                  style: const TextStyle(fontSize: 30.0),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                style: style,
                onPressed: () {
                  setState(() {
                    value = 3;
                  });
                },
                child: const Text('=',
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
              const SizedBox(width: 50)
            ],
          ),
          const Spacer(flex: 15),
        ],
      ),
    );
  }
}
