import 'dart:core';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Color c3 = const Color(0x5FAB47BC).withOpacity(0.2);
  Widget calcButton(String TextBton, Color x) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          calculation(TextBton);
        },
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          backgroundColor: x,
          foregroundColor: Colors.white,
          minimumSize: Size(70.0, 70.0),
          // elevation: 5,
        ),
        child: Text(
          "$TextBton",
          style: TextStyle(
            fontSize: 33,
          ),
        ),
      ),
    );
  }

  String input = '';
  String output = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCE93D8),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                color: const Color(0x6F6A1B9A),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    input,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 58,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Text(
                    output,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: <Widget>[
                    Expanded(child: calcButton("C", c3)),
                    Expanded(child: calcButton("%", c3)),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          calculation("<");
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: c3,
                          foregroundColor: Colors.white,
                          minimumSize: const Size(70.0, 70.0),
                          // elevation: 50,
                        ),
                        child: const Icon(Icons.undo, size: 35),
                      ),
                    ),
                    Expanded(child: calcButton("÷", c3)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(child: calcButton("7", c3)),
                    Expanded(child: calcButton("8", c3)),
                    Expanded(child: calcButton("9", c3)),
                    Expanded(child: calcButton("×", c3)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(child: calcButton("4", c3)),
                    Expanded(child: calcButton("5", c3)),
                    Expanded(child: calcButton("6", c3)),
                    Expanded(child: calcButton("–", c3)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(child: calcButton("1", c3)),
                    Expanded(child: calcButton("2", c3)),
                    Expanded(child: calcButton("3", c3)),
                    Expanded(child: calcButton("+", c3)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 4.0, left: 4.0, right: 4.0, bottom: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(child: calcButton("00", c3)),
                    Expanded(child: calcButton("0", c3)),
                    Expanded(child: calcButton(".", c3)),
                    Expanded(child: calcButton("=", c3)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void calculation(String value) {
    if (value == 'C') {
      input = '';
      output = '';
    } else if (value == '<') {
      if (input.length > 0) {
        input = input.substring(0, input.length - 1);
      }
    } else if (value == '=') {
      if (input.isNotEmpty) {
        var userInput = input;
        userInput = userInput.replaceAll("×", "*");
        userInput = userInput.replaceAll("–", "-");
        userInput = userInput.replaceAll("÷", "/");
        userInput = userInput.replaceAll("%", "*0.01*");

        // Check if there is a multiplication operation followed by a percentage operation
        if (userInput.contains("*")) {
          final parts = userInput.split("*");
          final lastIndex = parts.length - 1;

          // Handle cases like 'x*y%'
          if (parts[lastIndex].contains("%")) {
            parts[lastIndex] = parts[lastIndex].replaceAll("%", "*0.01");
            userInput = parts.join("*");
          }
        }

        Parser p = Parser();
        Expression expression = p.parse(userInput);
        ContextModel cm = ContextModel();
        var finalValue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalValue.toString();
        if (output.endsWith('.0')) {
          output = output.substring(0, output.length - 2);
        }
      }
    } else {
      input = input + value;
    }
    setState(() {
      input = input;
    });
  }

}




