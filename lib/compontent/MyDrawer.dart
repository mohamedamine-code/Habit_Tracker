import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app_02/models/theme_provider.dart';
import 'package:provider/provider.dart';

class Mydrawer extends StatelessWidget {
  Mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor:Theme.of(context).colorScheme.surface,
      child: Center(
        child: CupertinoSwitch(value: context.watch<ThemeProvider>().isDarkMode, onChanged: (value){
          return context.read<ThemeProvider>().ToggleTheme();
        }),
      ),
    );
  }
}