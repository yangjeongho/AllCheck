import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';


class GoGo extends StatefulWidget {
  //const GoGo({Key? key}) : super(key: key);
  final int? isChk;
  final String? isMsg;

  const GoGo({this.isChk, this.isMsg});
  @override
  _GoGoState createState() => _GoGoState(
    isChk: this.isChk,
    isMsg: this.isMsg,
  );
}

class _GoGoState extends State<GoGo> {
  /// Tracks if the animation is playing by whether controller is running.
  bool get isPlaying => _controller?.isActive ?? false;
  final int? isChk;
  final String? isMsg;
  _GoGoState({this.isChk, this.isMsg});

  Artboard? _riveArtboard;
  StateMachineController? _controller;
  SMIInput<double>? _levelInput;




  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    setValue(this.isChk!);
    log("Start MyEst value isChk  :"+isChk.toString());

    // Load the animation file from the bundle, note that you could also
    // download this. The RiveFile just expects a list of bytes.
    rootBundle.load("assets/riv/go17.riv").then(
      //rootBundle.load('assets/riv/skills.riv').then(

          (data) async {
        // Load the RiveFile from the binary data.
        final file = RiveFile.import(data);

        //_levelInput?.value = 0;

        // The artboard is the root of the animation and gets drawn in the
        // Rive widget.
        log("gogogogogo Check value :"+isChk.toString());
        final artboard = file.mainArtboard;

        for (final animation in artboard.animations) {
          log("gogogogogo ok ok.ok  value :"+animation.name);
          //if (animation is StateMachine && animation.name == stateMachineName) {
          //return StateMachineController(animation, onStateChange: onStateChange);
          //  }
        }

        var controller = StateMachineController.fromArtboard(artboard, 'State Machine 1');

        log("gogogogogo 18181818 ok ok.ok  value :"+_levelInput.toString());

        if (controller != null) {

          log("gogogogogo ok ok ok.ok  value :"+_levelInput.toString());

          artboard.addController(controller);
          _levelInput = controller.findInput('chk');

        }else{
          _levelInput?.value = 0;
        }

        log("Check value :"+_levelInput.toString());

        // log("2222222Start task value22222 :"+ widget.isChk);


        setState(() {
          _riveArtboard = artboard;
          if (isChk == 0){
            _levelInput?.value = 0;
          }else{
            _levelInput?.value = 1;
          }
          // _levelInput?.value = 0;
        } );
      },
    );
  }

  void setValue(int iLevel) async {
    if(iLevel== 1){
      _levelInput?.value = 1;
    }else{
      _levelInput?.value = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Container(

      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                if(_levelInput!.value == 1){
                  _levelInput?.value = 0;
                }else{
                  _levelInput?.value = 1;
                }

              });
            },
            child: Column(
              children: [
                Container(
                    width: 50,
                    height: 50,
                    child : Container(
                      child: Rive(
                        artboard: _riveArtboard!,
                      ),
                    )
                ),

              ],
            ),
          ),
        ],
      ),

    );
  }
}