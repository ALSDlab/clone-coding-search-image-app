import 'package:clone_coding_image_search_app/di/di_setup.dart';
import 'package:clone_coding_image_search_app/routes.dart';
import 'package:flutter/material.dart';

void main() {
  diSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
