import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animations/src/implicit_animations/implicit_homescreen.dart';

class ImplicitAnimatedContainer extends StatefulWidget {
  const ImplicitAnimatedContainer({Key? key}) : super(key: key);

  static const route = "${ImplicitHomescreen.route}/animated-container";

  @override
  _ImplicitAnimatedContainerState createState() =>
      _ImplicitAnimatedContainerState();
}

class _ImplicitAnimatedContainerState extends State<ImplicitAnimatedContainer> {
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(12);
  Color _color = Colors.red;
  double _height = 100;
  double _width = 100;

  final _random = Random();

  void _randomize() {
    _height = _random.nextInt(300).toDouble();
    _width = _random.nextInt(300).toDouble();

    _color = Color.fromRGBO(
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
      1,
    );

    _borderRadius = BorderRadius.circular(_random.nextInt(100).toDouble());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Container"),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.easeInCubic,
          height: _height,
          width: _width,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _randomize,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
