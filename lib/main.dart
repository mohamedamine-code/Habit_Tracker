import 'package:flutter/material.dart';
import 'package:note_app_02/Theme/Theme_dark.dart';
import 'package:note_app_02/Theme/Theme_light.dart';
import 'package:note_app_02/models/theme_provider.dart';
import 'package:note_app_02/pages/HomePage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_) => ThemeProvider(),child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:LightMode,
      home: Homepage());
  }
}
