import 'package:all_check/design_course/chat/newMessage.dart';
import 'package:flutter/material.dart';
import 'dart:math' as mach;
import '../navigation_home_screen.dart';
import 'package:rive/rive.dart';
import 'package:flutter/services.dart';

class RiveScreen extends StatefulWidget {
  @override
  _RiveScreenState createState() => _RiveScreenState();
}

class _RiveScreenState extends State<RiveScreen> {
  // Controller for playback
  late RiveAnimationController _controller;

  // Toggles between play and pause animation states
  void _togglePlay() =>
      setState(() => _controller.isActive = !_controller.isActive);

  /// Tracks if the animation is playing by whether controller is running
  bool get isPlaying => _controller.isActive;

  @override
  void initState() {
    super.initState();
    _controller = SimpleAnimation('idle');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // child: RiveAnimation.network(
        //   'https://cdn.rive.app/animations/vehicles.riv',
        //   controllers: [_controller],
        //   // Update the play state when the widget's initialized
        //   onInit: (_) => setState(() {}),
        // ),
          child: RiveAnimation.asset('assets/riv/turtle2.riv'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _togglePlay,
        tooltip: isPlaying ? 'Pause' : 'Play',
        child: Icon(
          isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
