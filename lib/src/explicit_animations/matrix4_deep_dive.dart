import 'package:flutter/material.dart';
import 'package:flutter_animations/src/explicit_animations/explicit_homescreen.dart';

class Matrix4DeepDivePage extends StatelessWidget {
  const Matrix4DeepDivePage({Key? key}) : super(key: key);

  static const route = "${ExplicitHomescreen.route}/matrix4-deep-dive";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Matrix4 Deep Dive"),
      ),
      body: Center(
        child: MagicSquareComponent(),
      ),
    );
  }
}

class MagicSquareComponent extends StatefulWidget {
  const MagicSquareComponent({
    Key? key,
  }) : super(key: key);

  @override
  _MagicSquareComponentState createState() => _MagicSquareComponentState();
}

class _MagicSquareComponentState extends State<MagicSquareComponent> {
  double x = 0.0;
  double y = 0.0;
  double z = 0.0;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.002)
        ..rotateX(x)
        ..rotateY(y)
        ..rotateZ(z),
      alignment: Alignment.center,
      child: GestureDetector(
        onPanUpdate: (dragDetails) {
          x = x + dragDetails.delta.dy / 100;
          y = y - dragDetails.delta.dx / 100;
          setState(() {});
        },
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.indigoAccent,
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
      ),
    );
  }
}
