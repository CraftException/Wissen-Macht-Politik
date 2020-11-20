import 'package:flutter/material.dart';
import 'package:vertretungsplan_mobile/About/AboutContainer.dart';
import 'package:vertretungsplan_mobile/HelpingClass.dart';
import 'package:vertretungsplan_mobile/side_bar_navigation.dart';

void main() {
  HelpingClass.isOnline().then((value) => {
    if (value) {
      runApp(WMPApp())
    } else {
      runApp(MaterialApp(
        title: 'Wissen Macht Politik',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: Scaffold(
          body: Center(
            child: Text("Kein Internet verfügbar! ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
        ),
      ))
    }
  }
  );
}

class WMPApp extends StatelessWidget {

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