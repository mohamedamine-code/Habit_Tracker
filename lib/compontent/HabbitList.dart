import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app_02/compontent/HabbitTile.dart';
import 'package:note_app_02/compontent/habit.dart';
import 'package:note_app_02/dataBase/habit_dataBase.dart';
import 'package:note_app_02/util/isHabitCompltyToday.dart';
import 'package:provider/provider.dart';

class HabbitList extends StatelessWidget {
  HabbitList({super.key});

  @override
  Widget build(BuildContext context) {


    void cheeckHabit(value, Habit habit) {
      if (value != null) {
        context.read<HabitDatabase>().updatedHabitCompletion(habit.id, value);
      }
    }

    final habitdatabase = context.watch<HabitDatabase>();
    List<Habit> currentHabit = habitdatabase.currentHabit;

    return Container(
      decoration: BoxDecoration(color: Colors.amber),

      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: currentHabit.length,
        itemBuilder: (context, index) {
          // get each indivudel habit
          final habit = currentHabit[index];
          // check if the habit complty today
          bool isCompltedToday = isHabitCompltyToday(habit.compltedDays);

          return HabbitTile(
            data: habit.name,
            isComplted: isCompltedToday,
            onChanged: (p0) => cheeckHabit(p0, habit),
          );
        },
      ),
    );
  }
}
