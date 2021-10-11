import 'package:flutter/material.dart';
import 'package:flutter_animations/src/explicit_animations/custom_circular_progress_bar/components/progress_bar_component.dart';

class AnimatedRing extends StatefulWidget {
  const AnimatedRing({
    Key? key,
    required this.activityIcon,
  }) : super(key: key);

  final IconData activityIcon;

  @override
  AnimatedRingState createState() => AnimatedRingState();
}

class AnimatedRingState extends State<AnimatedRing>
    with SingleTickerProviderStateMixin {
  bool showCheckMark = false;

  late final Animation<double> _animation;
  late final AnimationController _animationController;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );
    _animation =
        _animationController.drive(CurveTween(curve: Curves.easeInOut));
    _animation.addListener(() {
      if (_animation.isCompleted) {
        showCheckMark = true;
        setState(() {});
        Future.delayed(const Duration(seconds: 1), () {
          showCheckMark = false;
          setState(() {});
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        _animationController.forward();
      },
      onLongPressEnd: (_) {
        if (_animationController.isCompleted) {
        } else {
          _animationController.reverse();
        }
      },
      onDoubleTap: () {
        if (_animation.isCompleted) {
          _animationController.reset();
        }
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, Widget? child) {
          return ProgressBarComponent(
            progress: _animation.value,
            activityIcon: widget.activityIcon,
            actionComplete: _animation.isCompleted,
            showCheckMark: showCheckMark,
          );
        },
      ),
    );
  }
}
