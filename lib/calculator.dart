import 'package:calculator/click.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class calculator extends StatefulWidget {
  calculator({super.key});

  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
var userInput = '';
  var answer = '';
  List<String> button = [
    'C',
    '+/-',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    
                    child: Text(userInput, style: TextStyle(fontSize: 25, ),),
                  ),
                  Container(
                      padding: EdgeInsets.all(15),
                      alignment: Alignment.centerRight,
                      child: Text(answer, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)),
                ],
              ),
            )),
            Expanded(
              flex: 3,
              child: Container(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4),
                      itemCount: button.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == 0) {
                          return click(
                            buttontapped: () {
                              setState(() {
                                userInput = '';
                                answer = '0';
                              });
                            },
                            textcolor: Colors.black12,
                            colors: Colors.blue,
                            tittle: button[index],
                          );
                        } else if (index == 1) {
                          return click(
                            textcolor: Colors.black12,
                            colors: Colors.blue,
                            tittle: button[index],
                          );
                        }
                        // % Button
                        else if (index == 2) {
                          return click(
                            buttontapped: () {
                              setState(() {
                                userInput += button[index];
                              });
                            },
                            tittle: button[index],
                            colors: Colors.blue[50],
                            textcolor: Colors.black,
                          );
                        }
                        // Delete Button
                        else if (index == 3) {
                          return click(
                            buttontapped: () {
                              setState(() {
                                userInput = userInput.substring(
                                    0, userInput.length - 1);
                              });
                            },
                            tittle: button[index],
                            colors: Colors.blue[50],
                            textcolor: Colors.black,
                          );
                        }
                        // Equal_to Button
                        else if (index == 18) {
                          return click(
                            buttontapped: () {
                              setState(() {
                                equalPressed();
                              });
                            },
                            tittle: button[index],
                            colors: Colors.orange[700],
                            textcolor: Colors.white,
                          );
                        }

                        //  other button
                        else {
                          return click(
                            buttontapped: () {
                              setState(() {
                                userInput += button[index];
                              });
                            },
                            tittle: button[index],
                            colors: isOperator(button[index])
                                ? Colors.blueAccent
                                : Colors.white,
                            textcolor: isOperator(button[index])
                                ? Colors.white
                                : Colors.black,
                          );
                        }
                      })),
            ),
          ],
        ),
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }
}
