import 'package:flutter/material.dart';
import 'package:link/link.dart';
import 'package:vertretungsplan_mobile/View/alerts/AboutAlert.dart';

import 'View/Information.dart';
import 'View/Videos.dart';
import 'View/Videoselect.dart';

class TabContainerBottom extends StatefulWidget {
  TabContainerBottom({Key key}) : super(key: key);

  @override
  _TabContainerBottomState createState() => _TabContainerBottomState();
}

class _TabContainerBottomState extends State<TabContainerBottom> {
  int tabIndex = 0;
  List<Widget> listScreens;
  List<String> listStrings;
  @override
  void initState() {
    super.initState();
    listScreens = [
      Information(),
      Videos(),
      Videoselect()
    ];
    listStrings = [
      "Infos",
      "Videos",
      "Umfragen und Co."
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.blue,

      home: Scaffold(

        appBar: AppBar(
            title: Text(listStrings[tabIndex]),
            actions: <Widget>[
              // action button
                  Link(
                    child: Icon(Icons.info_outline),
                    url: "https://github.com/CraftException",
                ),
              IconButton(
                icon: Icon(Icons.monetization_on),
                onPressed: () {

                },
              ),
              // action button
              IconButton(
                icon: Icon(Icons.info),
                onPressed: () {
                  AboutAlert.showAboutAlert(context);
                },
              ),
            ]),
        body: listScreens[tabIndex],

        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey[400],
            backgroundColor: Theme.of(context).primaryColor,
            currentIndex: tabIndex,
            onTap: (int index) {
              setState(() {
                tabIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.info_outline),
                title: Text("Informationen"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.videocam),
                title: Text("Videos"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.face),
                title: Text("Umfragen und Co."),
              ),
            ]),

        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
