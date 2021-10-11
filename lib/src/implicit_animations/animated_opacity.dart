import 'package:flutter/material.dart';
import 'package:flutter_animations/src/implicit_animations/implicit_homescreen.dart';

class ImplicitAnimatedOpacity extends StatefulWidget {
  const ImplicitAnimatedOpacity({Key? key}) : super(key: key);

  static const route = "${ImplicitHomescreen.route}/animated-opacity";

  @override
  _ImplicitAnimatedOpacityState createState() =>
      _ImplicitAnimatedOpacityState();
}

class _ImplicitAnimatedOpacityState extends State<ImplicitAnimatedOpacity> {
  bool _visible = true;

  void _fadeLogo() {
    _visible = !_visible;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Opacity"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: _visible ? 1 : 0,
              duration: const Duration(milliseconds: 500),
              child: const FlutterLogo(size: 200),
            ),
            ElevatedButton(
              onPressed: _fadeLogo,
              child: _visible
                  ? const Text("Fade Logo")
                  : const Text("UnFade Logo"),
            ),
          ],
        ),
      ),
    );
  }
}
