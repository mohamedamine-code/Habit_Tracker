import 'package:flutter/material.dart';
import 'package:note_app_02/Theme/Theme_dark.dart';
import 'package:note_app_02/Theme/Theme_light.dart';

class ThemeProvider extends ChangeNotifier {
//intile Mode

ThemeData Mode=LightMode;

// get the current theme
ThemeData get getTheme =>Mode;

// Methode get to konw if it is DarkMode or not (for The switch button )

bool get isDarkMode=> Mode==DarkMode;

// set Theme 
set setThem(ThemeData x){
  Mode =x;
  notifyListeners();
}

// togglle Theme

void ToggleTheme(){
  if(Mode==LightMode){
    Mode=DarkMode;
  }else{
    Mode=LightMode;
  }
  notifyListeners();
}




}
