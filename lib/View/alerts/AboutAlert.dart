import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:link/link.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AboutAlert {

  static void showAboutAlert (BuildContext context) {
    Alert(
        context: context,
        title: "Über diese App",
        buttons: [],
        content: Column(
          children: <Widget>[
            Text(
              "Entwickler",
              style: TextStyle(fontSize: 18, height: 2),
            ),
            Link(
              child: Text(
                  "Moritz \"CraftException\" Kaufmann",
                  style: TextStyle(fontSize: 16, color: Colors.blue, height: 2)
              ),
              url: "https://craftexception.de/CraftException",
            ),

            Text(
              "Quellcode",
              style: TextStyle(fontSize: 18, height: 2),
            ),
            Link(
              child: Text(
                  "GitHub",
                  style: TextStyle(fontSize: 16, color: Colors.yellow, height: 2)
              ),
              url: "https://github.com/CraftException/WMP-Mobile-App",
            ),
            Text(
              "Verwendete Ressourcen",
              style: TextStyle(fontSize: 18, height: 2),
            ),
            Link(
              child: Text(
                  "Icons",
                  style: TextStyle(fontSize: 16, color: Colors.green, height: 2)
              ),
              url: "https://material.io/resources/icons",
            )
          ],
        )).show();
  }

}