import 'package:flutter/material.dart';
import 'package:omdb/main.dart';
import 'package:provider/provider.dart';

class MySwitch extends StatefulWidget {
  @override
  State<MySwitch> createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  bool _state = false;

  @override
  Widget build(BuildContext context) {
    DarkMode darkMode = Provider.of(context,listen: false);
    return Switch(
        value: _state,
        onChanged: (bool state) {
          _state = state;
          darkMode.dark = state;
          setState(() {});
        });
  }
}
