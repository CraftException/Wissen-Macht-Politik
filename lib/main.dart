import 'package:flutter/material.dart';
import 'file:///B:/vertretungsplan_mobile/lib/WMP_Channel/tab_container_bottom.dart';
import 'package:vertretungsplan_mobile/side_bar_navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wissen Macht Politik',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: AppDrawer(),
    );
  }
}