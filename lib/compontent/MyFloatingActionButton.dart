import 'package:flutter/material.dart';
import 'package:note_app_02/dataBase/habit_dataBase.dart';
import 'package:provider/provider.dart';

class MyFloatingActionButton extends StatelessWidget {
  MyFloatingActionButton({super.key});

  TextEditingController textControllor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final habit = context.read<HabitDatabase>();
    void addNewHabbit() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Add New Habit ✌️"),
            content: TextField(
              decoration: InputDecoration(
                label: Text("new Habit .."),
                labelStyle: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              controller: textControllor,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  textControllor.clear();
                },
                icon: Text("noo"),
              ),
              IconButton(
                onPressed: () {
                  habit.addHabit(textControllor.text);
                  textControllor.clear();
                  Navigator.pop(context);
                },
                icon: Text("yup"),
              ),
            ],
          );
        },
      );
    }

    return FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      onPressed: () {
        addNewHabbit();
      },
      child: Icon(Icons.add),
    );
  }
}
