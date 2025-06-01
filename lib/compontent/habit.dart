import 'package:isar/isar.dart';

part 'habit.g.dart';

@collection
class Habit {
  //id habit
  Id id = Isar.autoIncrement;

  // name habit
  late String name;

  // list of complted days
  List<DateTime> compltedDays = [
    //DateTime(years,month,days),
  ];
}
