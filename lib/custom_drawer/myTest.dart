import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

import '../design_course/chat/gogo.dart';
import '../design_course/chat/myCheckbox.dart';

/// An example showing how to drive two boolean state machine inputs.
class ExampleStateMachine extends StatefulWidget {
  const ExampleStateMachine({Key? key}) : super(key: key);

  @override
  _ExampleStateMachineState createState() => _ExampleStateMachineState();
}

class _ExampleStateMachineState extends State<ExampleStateMachine> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Skills Machine'),
      ),
      body:
         Padding(
           padding: const EdgeInsets.all(1.0),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  // Container(
                  //   color: Colors.red,
                  //   height: 100,
                  //   width: 100,
                  //
                  // ),
                  // Container(
                  //   color: Colors.blue,
                  //   height: 100,
                  //   width: 100,
                  //
                  // ) ,
                  // Container(
                  //   color: Colors.green,
                  //   height: 100,
                  //   width: 100,
                  //
                  // )
                  Row(children: [
                    GoGo(isChk: 0),
                    Text("출발 test 가자 우리 할 수 있다.!!! "),
                    // GoGo(isChk: 1),
                    // Text("공증사무소 "),
                    // GoGo(isChk: 1),
                    // Text("text ")
                    ],
                  ),



                  Row(children: [
                    MyCheckbox(),
                    Text("Test 3")
                  ],
                  ),
                  Row(children: [
                    MyCheckbox(),
                    Text("5/11 대한항공 김포->제주 13:20 출발 ")
                  ],
                  ),
                  Row(children: [
                    MyCheckbox(),
                    Text("Test 5")
                  ],
                  ),
                  Row(children: [
                    MyCheckbox(),
                    Text("Test 6")
                  ],
                  ),                  Row(children: [
                    MyCheckbox(),
                    Text("Test 7")
                  ],
                  ),                  Row(children: [
                    MyCheckbox(),
                    Text("Test 8")
                  ],
                  ),                  Row(children: [
                    MyCheckbox(),
                    Text("Test 9")
                  ],
                  ),                  Row(children: [
                    MyCheckbox(),
                    Text("Test 10")
                  ],
                  ),                  Row(children: [
                    MyCheckbox(),
                    Text("Test 11")
                  ],
                  ),
                ],
              ),
         ),

      );
  }
}