import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HabbitTile extends StatelessWidget {
  String data;
  bool isComplted=false;
  void Function(bool?) onChanged;
  HabbitTile({required this.isComplted,required this.data,required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      margin: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isComplted?Colors.green:Theme.of(context).colorScheme.secondary,
      ),
      child: ListTile(
        title: Text(data),
        leading: Checkbox(value: isComplted, onChanged: onChanged),
      ),
    );
  }
}