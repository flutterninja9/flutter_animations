import 'package:flutter/material.dart';
import 'package:flutter_animations/src/explicit_animations/custom_circular_progress_bar/components/animated_ring.dart';
import 'package:flutter_animations/src/explicit_animations/explicit_homescreen.dart';

class CustomCircularProgressBarPage extends StatelessWidget {
  const CustomCircularProgressBarPage({Key? key}) : super(key: key);

  static const route =
      "${ExplicitHomescreen.route}/custom-cirular-progress-bar";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Circular Progress Bar"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 240,
              width: 240,
              child: AnimatedRing(
                activityIcon: Icons.place,
              ),
            ),
            SizedBox(height: 32),
            Instructions(),
          ],
        ),
      ),
    );
  }
}

class Instructions extends StatelessWidget {
  const Instructions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("TIP 1 : Press and hold for selecting activity"),
        SizedBox(height: 6),
        Text("TIP 2 : Double tap for unselecting"),
      ],
    );
  }
}
