import 'package:flutter/material.dart';
import 'package:flutter_animations/src/explicit_animations/custom_circular_progress_bar/custom_circular_progress_bar_page.dart';
import 'package:flutter_animations/src/explicit_animations/matrix4_deep_dive.dart';
import 'package:flutter_animations/src/explicit_animations/stopwatch_app/stopwatch_app_page.dart';
import 'package:flutter_animations/src/global/components/navigation_tile.dart';
import 'package:get/get.dart';

class ExplicitHomescreen extends StatelessWidget {
  const ExplicitHomescreen({Key? key}) : super(key: key);

  static const route = "/animation/explicit";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Explicit Animations"),
      ),
      body: ListView(
        children: [
          NavTile(
            title: "Stopwatch Example",
            onTap: () => Get.toNamed(StopWatchAppPage.route),
          ),
          NavTile(
            title: "Matrix4 Deep Dive",
            onTap: () => Get.toNamed(Matrix4DeepDivePage.route),
          ),
          NavTile(
            title: "Circular Progess Bar",
            onTap: () => Get.toNamed(CustomCircularProgressBarPage.route),
          ),
        ],
      ),
    );
  }
}
