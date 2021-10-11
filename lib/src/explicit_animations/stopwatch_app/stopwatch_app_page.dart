import 'package:flutter/material.dart';
import 'package:flutter_animations/src/explicit_animations/explicit_homescreen.dart';
import 'package:flutter_animations/src/explicit_animations/stopwatch_app/components/stopwatch_component.dart';

class StopWatchAppPage extends StatelessWidget {
  const StopWatchAppPage({Key? key}) : super(key: key);
  static const route = "${ExplicitHomescreen.route}/stopwatch";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stopwatch"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: AspectRatio(
            aspectRatio: 1.0,
            child: StopwatchComponent(),
          ),
        ),
      ),
    );
  }
}
