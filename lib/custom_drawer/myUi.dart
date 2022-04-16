import 'package:all_check/design_course/chat/newMessage.dart';
import 'package:flutter/material.dart';
import 'dart:math' as mach;
import '../navigation_home_screen.dart';
import 'package:rive/rive.dart';

class MyUi extends StatefulWidget {
  const MyUi({Key? key}) : super(key: key);
  @override
  State<MyUi> createState() => _MyUiState();
}

class _MyUiState extends State<MyUi> {

  @override
  Widget build(BuildContext context) {

    final double degrees = 45;
    final double radians = degrees * mach.pi /180;

    return Scaffold(
        appBar: AppBar(
          title: const Text('우리말로하자'),
          actions: [
            IconButton(
              onPressed: () {
                //_authentication.signOut();
                //Navigator.pop(context);
                NavigationHomeScreen();
              },
              icon: const Icon(
                Icons.exit_to_app_sharp,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
          SizedBox(
            width: 15,
            height: 25,
            child: Transform.rotate(angle: radians,
              child :
              Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 3,
                    height: 11,
                    color: Colors.orangeAccent,
                  ),

                  Container(

                    child: Row(
                      children: <Widget> [
                        Container(
                          alignment: Alignment.bottomRight,
                          width: 6,
                          height: 3,
                          color: Colors.black,
                        ),
                        Container(
                            alignment: Alignment.bottomRight,
                          width: 3,
                          height: 3,
                          color: Colors.red
                        ),

                      // Expanded(child: Messages()),
                      //NewMessage(),
                      ],
                    ),
                  ),
                ],
              ),
             ),
          ),
        ),
    );

  }
}
