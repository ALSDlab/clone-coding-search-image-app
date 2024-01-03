import 'package:clone_coding_image_search_app/di/di_setup.dart';
import 'package:clone_coding_image_search_app/routes.dart';
import 'package:clone_coding_image_search_app/ui/main_screen.dart';
import 'package:clone_coding_image_search_app/viewmodel/image_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
