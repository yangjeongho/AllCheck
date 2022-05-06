import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class MyCheckbox extends StatefulWidget {
  const MyCheckbox({Key? key}) : super(key: key);

  @override
  State<MyCheckbox> createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  /// Tracks if the animation is playing by whether controller is running.
  bool get isPlaying => _controller?.isActive ?? false;

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
    log("Start MyEst value :"+_levelInput.toString());

    // Load the animation file from the bundle, note that you could also
    // download this. The RiveFile just expects a list of bytes.
    //rootBundle.load('assets/riv/turtle34.riv').then(
        rootBundle.load('assets/riv/turtle35.riv').then(
      //rootBundle.load('assets/riv/skills.riv').then(

          (data) async {
        // Load the RiveFile from the binary data.
        final file = RiveFile.import(data);

        _levelInput?.value = 0;

        // The artboard is the root of the animation and gets drawn in the
        // Rive widget.
        log("gogogogogo Check value :"+_levelInput.toString());
        final artboard = file.mainArtboard;

        var controller = StateMachineController.fromArtboard(artboard, 'State Machine');

        log("gogogogogo 18181818 ok ok.ok  value :"+_levelInput.toString());

        if (controller != null) {

          log("gogogogogo ok ok ok.ok  value :"+_levelInput.toString());

          artboard.addController(controller);
          _levelInput = controller.findInput('checkYn');

        }else{
          _levelInput?.value = 0;
        }

        log("Check value :"+_levelInput.toString());

        setState(() {
          _riveArtboard = artboard;
          _levelInput?.value = 0;
        } );
      },
    );
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
                      width: 25,
                      height: 25,
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