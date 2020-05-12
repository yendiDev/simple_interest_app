import 'package:flutter/material.dart';
import 'Home.dart';

void main() => runApp( MaterialApp(
  title: "Simple Interest App",
  home: HomeScreen(),
  theme: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.indigo,
    accentColor: Colors.indigo
  ),
));
