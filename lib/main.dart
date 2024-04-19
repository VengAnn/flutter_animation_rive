import 'package:flutter/material.dart';
import 'package:flutter_animation/presentation/features/pages/homes/entrypoint/entry_point.dart';
import 'package:flutter_animation/presentation/features/pages/homes/home/components/side_menu.dart';
import 'package:flutter_animation/presentation/features/pages/onboarding/onboading_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter animation',
      home: EntryPoint(),
      //home: SideMenu(),
    );
  }
}
