import 'package:flutter/material.dart';
import 'package:flutter_animations/src/route.dart';
import 'package:get/route_manager.dart';

class AnimationApp extends StatelessWidget {
  const AnimationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.indigo,
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.initialRoute,
      getPages: AppRoute.pages,
    );
  }
}
