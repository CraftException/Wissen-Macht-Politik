import 'package:flutter/material.dart';

import '../WMP_Channel/View/Information.dart';
import '../WMP_Channel/View/Videos.dart';
import '../WMP_Channel/View/Videoselect.dart';

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
      color: Colors.blueGrey,

      home: Scaffold(

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

        backgroundColor: Colors.blueGrey,
      ),

    );
  }
}
