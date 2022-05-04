import 'dart:developer';

import 'package:all_check/design_course/chat/newMessage.dart';
import 'package:flutter/material.dart';
import 'dart:math' as mach;
import '../design_course/design_course_app_theme.dart';
import '../navigation_home_screen.dart';
import 'package:rive/rive.dart';
import 'package:flutter/services.dart';

class RiveScreen extends StatefulWidget {
  @override
  _RiveScreenState createState() => _RiveScreenState();
}

class _RiveScreenState extends State<RiveScreen> {

  bool isCheck = false;

  // Controller for playback
  late RiveAnimationController _controller;

  // Toggles between play and pause animation states
  void _togglePlay() =>
      setState(() {
        _controller.isActive = !_controller.isActive;
        isCheck =  isCheck == false? true:false;

        log("HOHO S :: "+isCheck.toString());

         // if(isCheck){
         //   _controller = SimpleAnimation('check');
         // }else {
         //   _controller = SimpleAnimation('work');
         // }

        log("HOHO S :: "+isCheck.toString());

      } );

  /// Tracks if the animation is playing by whether controller is running
  bool get isPlaying => _controller.isActive;

  @override
  void initState() {
    super.initState();
    _controller = SimpleAnimation('work');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:

      Column(
        children: [
          SizedBox(height: 30,),
          GestureDetector(
            onTap: (){
              _togglePlay;
            },
            child: Center(
              child :Container(
               // color: Colors.blue,
                width: 100,
                height: 100,
                // child: RiveAnimation.network(
                //   'https://cdn.rive.app/animations/vehicles.riv',
                //   controllers: [_controller],
                //   // Update the play state when the widget's initialized
                //   onInit: (_) => setState(() {}),
                // ),
                  child: RiveAnimation.asset(
                      'assets/riv/turtle32.riv',
                      //controllers: [_controller],
                     // animations: const ['work', 'check'],
                      onInit: (_) => setState(() {

                      })
                                             ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Text("TEST 테스트"),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _togglePlay,
        tooltip: isPlaying ? 'work' : 'check',
        child: Icon(
          isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
