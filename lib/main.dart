import 'package:flutter/material.dart';
import 'package:note_app_02/dataBase/habit_dataBase.dart';
import 'package:note_app_02/models/theme_provider.dart';
import 'package:note_app_02/pages/HomePage.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // initialize the dataBase
  await HabitDatabase.initialize();
  await HabitDatabase().saveFirstlanchDate();
  runApp(MultiProvider(
    child: MyApp(),
    providers: [
    ChangeNotifierProvider(create: (_)=>HabitDatabase()),
    ChangeNotifierProvider(create: (_)=>ThemeProvider()),

  ] ,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initale the mode of app from the provider Theme , use this "Provider.of<ThemeProvider>(context).Mode"
      // or this "context.watch<ThemeProvider>().Mode"
      // you should use .watch ==> it rebuild the UI
      // When you use .read ==> it just read value and not do any modification !!! 
      // does not listen to change .
      theme: context.watch<ThemeProvider>().Mode,
      home: Homepage());
  }
}
