import 'package:flutter/material.dart';
import 'package:flutter_animations/src/explicit_animations/explicit_homescreen.dart';
import 'package:flutter_animations/src/global/components/navigation_tile.dart';
import 'package:flutter_animations/src/implicit_animations/implicit_homescreen.dart';
import 'package:get/get.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);

  static const route = "/animation";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Animations"),
      ),
      body: ListView(
        children: [
          NavTile(
            title: "Implicit Examples",
            onTap: () {
              Get.toNamed(ImplicitHomescreen.route);
            },
          ),
          NavTile(
            title: "Explicit Examples",
            onTap: () {
              Get.toNamed(ExplicitHomescreen.route);
            },
          ),
        ],
      ),
    );
  }
}
