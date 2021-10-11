import 'package:flutter_animations/src/explicit_animations/custom_circular_progress_bar/custom_circular_progress_bar_page.dart';
import 'package:flutter_animations/src/explicit_animations/explicit_homescreen.dart';
import 'package:flutter_animations/src/explicit_animations/matrix4_deep_dive.dart';
import 'package:flutter_animations/src/explicit_animations/stopwatch_app/stopwatch_app_page.dart';
import 'package:flutter_animations/src/homescreen/homescreen.dart';
import 'package:flutter_animations/src/implicit_animations/animated_container.dart';
import 'package:flutter_animations/src/implicit_animations/animated_opacity.dart';
import 'package:flutter_animations/src/implicit_animations/implicit_homescreen.dart';
import 'package:flutter_animations/src/implicit_animations/tween_animation_builder.dart';
import 'package:get/route_manager.dart';

abstract class AppRoute {
  AppRoute._();

  static const initialRoute = Homescreen.route;
  static final List<GetPage> pages = [
    /// Initial Page
    GetPage(
      name: Homescreen.route,
      page: () => Homescreen(),
    ),

    /// Implicit Animation Pages
    GetPage(
      name: ImplicitHomescreen.route,
      page: () => ImplicitHomescreen(),
    ),
    GetPage(
      name: ImplicitAnimatedOpacity.route,
      page: () => ImplicitAnimatedOpacity(),
    ),
    GetPage(
      name: ImplicitAnimatedContainer.route,
      page: () => ImplicitAnimatedContainer(),
    ),
    GetPage(
      name: ImplicitTweenAnimationBuilder.route,
      page: () => ImplicitTweenAnimationBuilder(),
    ),

    /// Explicit Animation Pages

    GetPage(
      name: ExplicitHomescreen.route,
      page: () => ExplicitHomescreen(),
    ),
    GetPage(
      name: StopWatchAppPage.route,
      page: () => StopWatchAppPage(),
    ),
    GetPage(
      name: Matrix4DeepDivePage.route,
      page: () => Matrix4DeepDivePage(),
    ),
    GetPage(
      name: CustomCircularProgressBarPage.route,
      page: () => CustomCircularProgressBarPage(),
    ),
  ];
}
