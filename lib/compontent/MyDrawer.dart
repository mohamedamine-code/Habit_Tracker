import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app_02/models/theme_provider.dart';
import 'package:provider/provider.dart';

class Mydrawer extends StatelessWidget {
  Mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Center(
        child: CupertinoSwitch(
          // this proprety take a bool so you need to crate a function return 
          // a bool value in your provider  
          
          value: context.read<ThemeProvider>().isDarkMode,

          // this is the function which change the mode 
          onChanged: (value) {
            // .read ==> To just read without rebuild Widget or
            // """"" to just change state !!!"""" 
            //.watch ==> To read and rebuild Widget (rebuild is obilgatoire) 
            context.read<ThemeProvider>().ToggleTheme();
          },
        ),
      ),
    );
  }
}
