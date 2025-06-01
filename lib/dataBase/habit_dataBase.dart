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
  Future <DateTime?> getFirstLanchDate()async{
    final settings= await isar.appSettings.where().findFirst();
    return settings?.FirstlanchDate;
  }
  

}
