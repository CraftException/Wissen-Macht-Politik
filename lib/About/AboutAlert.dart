import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../HelpingClass.dart';

class AboutAlert {

  static void showAboutAlert(BuildContext context) {
    Alert(
      context: context,
      title: "Über diese App",

      content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Text("Entwickler", style: TextStyle(fontSize: 20, height: 1.3),),
                  GestureDetector(
                    child: Text(
                        "Moritz \"CraftException\" Kaufmann",
                        style: TextStyle(fontSize: 17, color: Colors.blue, height: 1.3)
                    ),
                    onTap: () {
                      HelpingClass.launchURL("https://github.com/CraftException");
                    },
                  ),

                  Text("Quellcode", style: TextStyle(fontSize: 20, height: 1.3),),
                  GestureDetector(
                    child: Text(
                        "GitHub Repository",
                        style: TextStyle(fontSize: 17, color: Colors.blue, height: 1.3)
                    ),
                    onTap: () {
                      HelpingClass.launchURL("https://github.com/CraftException/wmp_mobile_app");
                    },
                  ),//https://github.com/CraftException/wmp_mobile_app/issues/new              
                  GestureDetector(
                    child: Text(
                        "Fehler melden",
                        style: TextStyle(fontSize: 17, color: Colors.blue, height: 1.3)
                    ),
                    onTap: () {
                      HelpingClass.launchURL("https://github.com/CraftException/wmp_mobile_app/issues/new");
                    },
                  ),

                  Text("Verwendete Ressourcen", style: TextStyle(fontSize: 20, height: 1.3),),
                  GestureDetector(
                    child: Text(
                        "Material-Icons",
                        style: TextStyle(fontSize: 17, color: Colors.blue, height: 1.3)
                    ),
                    onTap: () {
                      HelpingClass.launchURL("https://material.io/resources/icons");
                    },
                  ),
                  GestureDetector(
                    child: Text(
                        "Link",
                        style: TextStyle(fontSize: 17, color: Colors.blue, height: 1.3)
                    ),
                   onTap: () {
                      HelpingClass.launchURL("https://pub.dev/packages/link");
                   },
                  ),



                ],
              ),
    ).show();
  }

}