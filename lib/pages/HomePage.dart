import 'package:flutter/material.dart';
import 'package:note_app_02/compontent/HabbitList.dart';
import 'package:note_app_02/compontent/MyDrawer.dart';
import 'package:note_app_02/compontent/MyFloatingActionButton.dart';
import 'package:note_app_02/dataBase/habit_dataBase.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    Provider.of<HabitDatabase>(context,listen: false).re_read();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Mydrawer(),
      floatingActionButton: MyFloatingActionButton(),
      body: SafeArea(child: HabbitList()),
    );
  }
}