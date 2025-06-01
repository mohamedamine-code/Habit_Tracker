import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
import 'package:note_app_02/compontent/app_setting.dart';
import 'package:note_app_02/compontent/habit.dart';
import 'package:path_provider/path_provider.dart';

class HabitDatabase extends ChangeNotifier {
  static late Isar isar;

  // initialize - dataBase

  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([
      AppSettingSchema,
      HabitSchema,
    ], directory: dir.path);
  }

  //the first Time When app Startup

  Future<void> saveFirstlanchDate() async {
    // check if there is an object "appSetiing" of the class "AppSetiing()" was created in Isar
    // using "isar.appSettings.where()"
    // after that go and checks if he have an item by ".findFirst()"
    // if there's not , it will return null
    // await ==> Wait for the database to finish do there actions

    final exstingSetting = await isar.appSettings.where().findFirst();

    if (exstingSetting == null) {
      // we are create a objetc name settings and have an item "FirstlanchDate"
      final settings = AppSetting()..FirstlanchDate = DateTime.now();
      // we add to Firebase with the Wirte Transction
      //  isar.writeTxn(); ==> start write in Isar DataBase - isar needs this to make a change in the DB
      // isar.appSettings.put(settings); ==> put the "settings" object in the "appSettings" collection
      // in the dataBase.
      await isar.writeTxn(() => isar.appSettings.put(settings));
    }
  }

  // get the first date for app startup

  Future<DateTime?> getFirstLanchDate() async {
    final settings = await isar.appSettings.where().findFirst();
    return settings?.FirstlanchDate;
  }

  // List ofntsHabir habit
  List<Habit> currentHabit = [];

  // Creat a new habit
  Future<void> addHabit(String name) async {
    //create a habit
    final newHabit = Habit()..name = name;
    // save to the database
    await isar.writeTxn(() => isar.habits.put(newHabit));
    //re-red from the DB
    re_read();
  }

  // read a habit
  Future<void> re_read() async {
    //fetch all the habit from the data base
    List<Habit> fetchHabit = await isar.habits.where().findAll();

    // give to cuurent habit list
    currentHabit.clear();
    currentHabit.addAll(fetchHabit);

    //rebuid UI
    notifyListeners();
  }

  //updated - check habit on or off
  Future<void> updatedHabitCompletion(int id, bool isComplted) async {
    // find the sepcif habit
    final habit = await isar.habits.get(id);

    // update completion status
    if (habit != null) {
      await isar.writeTxn(() async {
        // if the habit is complted and the date not in the compltedDays ==> addeted
        //y.contains(x) ==> checkek if the x is in y or not ?
        if (isComplted && !habit.compltedDays.contains(DateTime.now())) {
          // date of today
          final today = DateTime.now();
          // add to the compltedDays of the habit
          habit.compltedDays.add(DateTime(today.day, today.month, today.year));
        } else {
          habit.compltedDays.removeWhere(
            (date) =>
                date.month == DateTime.now().month &&
                date.year == DateTime.now().year &&
                date.day == DateTime.now().day,
          );
        }
        // save this habit in the DB
        await isar.habits.put(habit);
      });
    }

  re_read();
  }

  //updated - edit habit name
  Future<void>updatedHabitName(int id,String NewName)async{
    // fetch the specific habit 
    final habit= await isar.habits.get(id);
    // rename the habit
    if(habit!=null){
      await isar.writeTxn(()async{
        //updtae name
        habit.name=NewName;
        // save the update back 
        await isar.habits.put(habit);
      });
    }

    // re-red in the db
    re_read();
  }

  //deltae habit
  Future<void> DelateHabit(int id)async{
  // get the habit
  final habit= await isar.habits.get(id);
  if(habit!=null){
    await isar.writeTxn(()async{
      await isar.habits.delete(id);
    });
  }
  re_read();
  }
}
