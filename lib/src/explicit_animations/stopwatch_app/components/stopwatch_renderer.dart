import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animations/src/explicit_animations/stopwatch_app/components/clock_hand.dart';
import 'package:flutter_animations/src/explicit_animations/stopwatch_app/components/elapsed_time_text_basic.dart';
import 'package:flutter_animations/src/explicit_animations/stopwatch_app/components/seconds_ticker.dart';

class StopWatchRenderer extends StatelessWidget {
  const StopWatchRenderer({
    Key? key,
    required this.elapsed,
    required this.radius,
  }) : super(key: key);

  final Duration elapsed;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Container(
        //   decoration: BoxDecoration(
        //     border: Border.all(
        //       width: 3,
        //       color: Colors.deepOrangeAccent,
        //     ),
        //     borderRadius: BorderRadius.circular(radius),
        //   ),
        // ),
        for (int i = 0; i < 60; i++)
          Positioned(
            top: radius,
            left: radius,
            child: SecondsTicker(radius: radius, second: i),
          ),
        for (int i = 5; i <= 60; i += 5)
          Positioned(
            top: radius,
            left: radius,
            child: ClockTextMarker(value: i, maxValue: 60, radius: radius),
          ),
        Positioned(
          left: radius,
          top: radius,
          child: ClockHand(
            roatationZ: pi + (2 * pi / 60000) * elapsed.inMilliseconds,
            handThickness: 2,
            handLenght: radius,
            handColor: Colors.orange,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: radius * 1.4,
          child: ElapsedTimeTextBasic(
            elapsedDuration: elapsed,
          ),
        ),
      ],
    );
  }
}
