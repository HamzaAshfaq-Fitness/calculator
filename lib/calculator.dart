import 'package:calculator/widget/my_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  var inputNum='';
  var result='';

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return  Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.05,vertical: screenHeight*0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(inputNum.toString(),style: const TextStyle(color: Colors.white,fontSize: 35),),
                       SizedBox(
                        height: screenHeight*0.05,
                      ),
                      Text(result.toString(),style:  TextStyle(color: Colors.white.withOpacity(0.6),fontSize: 22)),
                    ],
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Row(
                    children: [
                      MyButton(
                        onPress: () {
                          inputNum='';
                          result='';
                          setState(() {});
                          },
                        title: 'AC',
                      ),
                      MyButton(
                        onPress: () {},
                        title: '+/-',
                      ),
                      MyButton(
                        onPress: () {},
                        title: '%',
                      ),
                      MyButton(
                        onPress: () {
                          inputNum+='/';
                          setState(() {});
                          },
                        title: '/',
                        color: const Color(0xffffa00a),
                      ),
                    ],
                  ),
                   SizedBox(
                    height: screenHeight*0.022,
                  ),
                  Row(
                    children: [
                      MyButton(
                        onPress: () {
                          inputNum+='7';
                          setState(() {});
                        },
                        title: '7',
                      ),
                      MyButton(
                        title: '8',
                        onPress: () {
                          inputNum+='8';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '9',
                        onPress: () {
                          inputNum+='9';
                          setState(() {});
                          },
                      ),
                      MyButton(
                        title: 'x',
                        color: const Color(0xffffa00a),
                        onPress: () {
                          inputNum+='x';
                          setState(() {});
                          },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight*0.022,
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: '4',
                        onPress: () {
                          inputNum+='4';
                          setState(() {});
                          },
                      ),
                      MyButton(
                        title: '5',
                        onPress: () {
                          inputNum+='5';
                          setState(() {});
                          },
                      ),
                      MyButton(
                        title: '6',
                        onPress: () {
                          inputNum+='6';
                          setState(() {});
                          },
                      ),
                      MyButton(
                        title: '-',
                        color: const Color(0xffffa00a),
                        onPress: () {
                          inputNum+='-';
                          setState(() {});
                          },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight*0.022,
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: '1',
                        onPress: () {
                          inputNum+='1';
                          setState(() {});
                          },
                      ),
                      MyButton(
                        title: '2',
                        onPress: () {
                          inputNum+='2';
                          setState(() {});
                          },
                      ),
                      MyButton(
                        title: '3',
                        onPress: () {
                          inputNum+='3';
                          setState(() {});
                          },
                      ),
                      MyButton(
                        title: '+',
                        color: const Color(0xffffa00a),
                        onPress: () {
                          inputNum+='+';
                          setState(() {});
                          },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight*0.022,
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: '0',
                        onPress: () {
                          inputNum+='0';
                          setState(() {});
                          },
                      ),
                      MyButton(
                        title: '.',
                        onPress: () {
                          inputNum+='.';
                          setState(() {});
                          },
                      ),
                      MyButton(
                        title: 'DEL',
                        onPress: () {
                          inputNum=inputNum.substring(0,inputNum.length-1);
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '=',
                        color: const Color(0xffffa00a),
                        onPress: () {
                          pressEqual();
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void pressEqual(){
    if(result.isEmpty){
      String finalInputNum=inputNum;
      finalInputNum=inputNum.replaceAll('x', '*');
      Parser p= Parser();
      Expression expression=p.parse(finalInputNum);
      ContextModel contextModel=ContextModel();
      double evaluation=expression.evaluate(EvaluationType.REAL, contextModel);
      result=evaluation.toString();
    }
    else{
      inputNum=result;
      result='';
    }
  }
}

