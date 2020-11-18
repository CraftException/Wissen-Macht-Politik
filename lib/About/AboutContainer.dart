import 'package:flutter/material.dart';
import 'package:link/link.dart';

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
              alignment: Alignment.center,
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Über diese App", style: TextStyle(fontSize: 30),),

                  Text("Entwickler", style: TextStyle(fontSize: 22, height: 2),),
                  Link(
                    child: Text(
                        "Moritz \"CraftException\" Kaufmann",
                        style: TextStyle(fontSize: 19, color: Colors.blue, height: 2)
                    ),
                    url: "https://craftexception.de/CraftException",
                  ),

                  Text("Quellcode", style: TextStyle(fontSize: 22, height: 4),),
                  Link(
                    child: Text(
                        "GitHub Repository",
                        style: TextStyle(fontSize: 19, color: Colors.red, height: 2)
                    ),
                    url: "https://github.com/CraftException/WMP-Mobile-App",
                  ),

                  Text("Verwendete Ressourcen", style: TextStyle(fontSize: 22, height: 4),),
                  Link(
                    child: Text(
                        "Material-Icons",
                        style: TextStyle(fontSize: 19, color: Colors.green, height: 2)
                    ),
                    url: "https://material.io/resources/icons",
                  ),
                  Link(
                    child: Text(
                        "Link",
                        style: TextStyle(fontSize: 19, color: Colors.greenAccent, height: 2)
                    ),
                    url: "https://pub.dev/packages/link",
                  ),



                ],
              ),
            )
        ],
       ),
     );
  }

}