import 'dart:math';

import 'package:flutter/material.dart';

class ProgressBarComponent extends StatelessWidget {
  const ProgressBarComponent({
    Key? key,
    required this.progress,
    required this.actionComplete,
    required this.showCheckMark,
    required this.activityIcon,
  }) : super(key: key);

  final bool actionComplete;
  final double progress;
  final bool showCheckMark;
  final IconData activityIcon;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: CustomPaint(
        painter: RingPainter(
          progress: progress,
          activeColor: Colors.white,
          inActiveColor: Colors.grey,
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          margin: const EdgeInsets.all(22.0),
          decoration: BoxDecoration(
            color: actionComplete ? Colors.white : Colors.indigo,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              showCheckMark ? Icons.done : activityIcon,
              color: actionComplete ? Colors.indigo : Colors.white,
              size: 50,
            ),
          ),
        ),
      ),
    );
  }
}

class RingPainter extends CustomPainter {
  RingPainter({
    required this.progress,
    required this.activeColor,
    required this.inActiveColor,
  });

  final Color activeColor;
  final Color inActiveColor;
  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.height / 2;
    final backgroundPaint = Paint()
      ..strokeWidth = 2
      ..color = inActiveColor;
    canvas.drawCircle(
      Offset(size.height / 2, size.width / 2),
      size.height / 2,
      backgroundPaint,
    );

    final foregroundPaint = Paint()
      ..strokeWidth = 2
      ..color = activeColor
      ..style = PaintingStyle.fill;

    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(radius, radius),
        radius: radius,
      ),
      -pi / 2,
      2 * pi * progress,
      true,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(covariant RingPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
