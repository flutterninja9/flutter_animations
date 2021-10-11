import 'dart:math';

import 'package:flutter/material.dart';

class SecondsTicker extends StatelessWidget {
  const SecondsTicker({
    Key? key,
    required this.radius,
    required this.second,
  }) : super(key: key);

  final radius;
  final second;

  @override
  Widget build(BuildContext context) {
    final _tickerColor = second % 5 == 0 ? Colors.white : Colors.grey;
    final height = 12.0;
    final width = 2.0;
    return Transform(
      transform: Matrix4.identity()
        ..translate(-width / 2, -height / 2)
        ..rotateZ(2 * pi * (second / 60.0))
        ..translate(0.0, radius - height / 2, 0.0),
      child: Container(
        height: height,
        width: width,
        color: _tickerColor,
      ),
    );
  }
}

class ClockTextMarker extends StatelessWidget {
  const ClockTextMarker({
    Key? key,
    required this.value,
    required this.maxValue,
    required this.radius,
  }) : super(key: key);

  final int maxValue;
  final double radius;
  final int value;

  @override
  Widget build(BuildContext context) {
    final _label = value % 5 == 0 ? value.toString() : '';
    final double height = 30;
    final double width = 40;
    return Transform(
      transform: Matrix4.identity()
        ..translate(-width / 2, -height / 2)
        ..rotateZ(pi + 2 * pi * (value / maxValue))
        ..translate(0.0, radius - 35, 0.0)
        ..rotateZ(pi - 2 * pi * (value / maxValue)),
      child: SizedBox(
        width: width,
        height: height,
        child: Center(
          child: Text(
            _label,
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
