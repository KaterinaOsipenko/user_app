import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/presentation/bindings/cards_controller_binding.dart';
import 'package:user_app/presentation/screens/cards_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: CardsControllerBinding(),
      home: CardsScreen(),
    );
  }
}
