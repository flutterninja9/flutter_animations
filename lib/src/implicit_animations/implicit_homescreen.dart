import 'package:flutter/material.dart';
import 'package:flutter_animations/src/global/components/navigation_tile.dart';
import 'package:flutter_animations/src/implicit_animations/animated_container.dart';
import 'package:flutter_animations/src/implicit_animations/animated_opacity.dart';
import 'package:flutter_animations/src/implicit_animations/tween_animation_builder.dart';
import 'package:get/get.dart';

class ImplicitHomescreen extends StatelessWidget {
  const ImplicitHomescreen({Key? key}) : super(key: key);

  static const route = "/animation/implicit";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Implicit Animations"),
      ),
      body: ListView(
        children: [
          NavTile(
            title: "AnimatedContainer",
            onTap: () {
              Get.toNamed(ImplicitAnimatedContainer.route);
            },
          ),
          NavTile(
            title: "AnimatedOpacity",
            onTap: () {
              Get.toNamed(ImplicitAnimatedOpacity.route);
            },
          ),
          NavTile(
            title: "TweenAnimationBuilder",
            onTap: () {
              Get.toNamed(ImplicitTweenAnimationBuilder.route);
            },
          ),
        ],
      ),
    );
  }
}
