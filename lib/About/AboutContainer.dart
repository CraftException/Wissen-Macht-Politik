import 'package:flutter/material.dart';
import 'package:vertretungsplan_mobile/HelpingClass.dart';

class AboutContainer extends StatefulWidget {

  AboutContainer({Key key}) : super(key: key);

  @override
  _AboutContainerState createState() => _AboutContainerState();

}

class _AboutContainerState extends State<AboutContainer> {

  @override
  Widget build(BuildContext context) {
     return SingleChildScrollView(
       child: Stack (
          children: <Widget>[
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Über diese App", style: TextStyle(fontSize: 30),),

                  Text("Entwickler", style: TextStyle(fontSize: 22, height: 2),),
                  GestureDetector(
                    child: Text(
                        "Moritz \"CraftException\" Kaufmann",
                        style: TextStyle(fontSize: 19, color: Colors.blue, height: 2)
                    ),
                    onTap: () {
                      HelpingClass.launchURL("https://craftexception.de/CraftException");
                    },
                  ),

                  Text("Quellcode", style: TextStyle(fontSize: 22, height: 4),),
                  GestureDetector(
                    child: Text(
                        "GitHub Repository",
                        style: TextStyle(fontSize: 19, color: Colors.blue, height: 2)
                    ),
                    onTap: () {
                      HelpingClass.launchURL("https://github.com/CraftException/WMP-Mobile-App");
                    },
                  ),

                  Text("Verwendete Ressourcen", style: TextStyle(fontSize: 22, height: 4),),
                  GestureDetector(
                    child: Text(
                        "Material-Icons",
                        style: TextStyle(fontSize: 19, color: Colors.blue, height: 2)
                    ),
                    onTap: () {
                      HelpingClass.launchURL("https://material.io/resources/icons");
                    },
                  ),
                  GestureDetector(
                    child: Text(
                        "Link",
                        style: TextStyle(fontSize: 19, color: Colors.blue, height: 2)
                    ),
                   onTap: () {
                      HelpingClass.launchURL("https://pub.dev/packages/link");
                   },
                  ),



                ],
              ),
            )
        ],
       ),
     );
  }

}