import 'package:flutter/material.dart';

class ElapsedTimeTextBasic extends StatelessWidget {
  const ElapsedTimeTextBasic({
    Key? key,
    required this.elapsedDuration,
  }) : super(key: key);

  final Duration elapsedDuration;

  @override
  Widget build(BuildContext context) {
    final hundreds = (elapsedDuration.inMilliseconds / 10) % 100;
    final seconds = elapsedDuration.inSeconds;
    final minutes = elapsedDuration.inMinutes;

    /// padLeft means if len(str) < 2, then add 0 on the left of given str
    final hundredStr = hundreds.toStringAsFixed(0).padLeft(2, '0');
    final secondStr = seconds.toString().padLeft(2, '0');
    final minuteStr = minutes.toString().padLeft(2, '0');
    return Text(
      "$minuteStr:$secondStr:$hundredStr",
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w300,
      ),
      textAlign: TextAlign.center,
    );
  }
}
