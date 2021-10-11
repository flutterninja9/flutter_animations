import 'package:flutter/material.dart';

class ClockHand extends StatelessWidget {
  const ClockHand({
    Key? key,
    required this.roatationZ,
    required this.handThickness,
    required this.handLenght,
    this.handColor,
  }) : super(key: key);

  final Color? handColor;
  final double handLenght;
  final double handThickness;
  final double roatationZ;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..translate(-handThickness / 2)
        ..rotateZ(roatationZ),
      alignment: Alignment.topCenter,
      child: Container(
        height: handLenght,
        width: handThickness,
        color: handColor,
      ),
    );
  }
}
