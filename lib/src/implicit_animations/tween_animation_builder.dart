import 'package:flutter/material.dart';
import 'package:flutter_animations/src/implicit_animations/implicit_homescreen.dart';

class ImplicitTweenAnimationBuilder extends StatefulWidget {
  const ImplicitTweenAnimationBuilder({Key? key}) : super(key: key);

  static const route = "${ImplicitHomescreen.route}/tween-animation-builder";

  @override
  _ImplicitTweenAnimationBuilderState createState() =>
      _ImplicitTweenAnimationBuilderState();
}

class _ImplicitTweenAnimationBuilderState
    extends State<ImplicitTweenAnimationBuilder> {
  double hue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Tween Animation Builder"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0.0, end: hue),
                  duration: const Duration(milliseconds: 1500),
                  builder: (context, double hue, child) {
                    final hsvColor = HSVColor.fromAHSV(1.0, hue, 1.0, 1.0);
                    return Container(
                      height: 200,
                      width: 200,
                      color: hsvColor.toColor(),
                    );
                  },
                ),
                const SizedBox(height: 35),
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        for (double hue = 0.0; hue < 360.0; hue++)
                          HSVColor.fromAHSV(1.0, hue, 1.0, 1.0).toColor()
                      ],
                      stops: [
                        for (double hue = 0.0; hue < 360.0; hue++) hue / 360.0
                      ],
                    ),
                  ),
                ),
                Slider.adaptive(
                  value: hue,
                  min: 0.0,
                  max: 360.0,
                  onChanged: (h) {
                    hue = h;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
