import 'package:flutter/material.dart';
import 'package:link/link.dart';
import 'package:vertretungsplan_mobile/WMP_Channel/tab_container_bottom.dart';

import 'About/AboutContainer.dart';

class AppDrawer extends StatefulWidget {
  AppDrawer({Key key}) : super(key: key);

  @override
  _AppDrawer createState() => _AppDrawer();
}

class _AppDrawer extends State<AppDrawer> {

  List<Widget> listScreens;
  List<String> listStrings;

  Widget content;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.blue,
      home: Scaffold(
        body: content,
        appBar: AppBar(
            title: Text("Wissen Macht Politik"),
            actions: <Widget>[
              // action button
              Link(
                child: Icon(Icons.info_outline),
                url: "https://www.youtube.com/channel/UC3OSxVUrgZDF7223ZYjLqdQ",
              ),
              IconButton(
                icon: Icon(Icons.monetization_on),
                onPressed: () {

                },
              ),
            ]),
          drawer: _createDrawer(context),
      ),
    );
  }

  @override
  Widget _createDrawer(BuildContext context) {
   return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(icon: Icons.apps, text: 'Aktuelles', onTap: () => {

          }),
          _createDrawerItem(icon: Icons.flag, text: 'DE-News',),
          _createDrawerItem(icon: Icons.account_circle, text: 'Covid-19',),
          Divider(),
          _createDrawerItem(icon: Icons.note, text: 'WMP Kanal', onTap: () => {
            setState(() {
              content = TabContainerBottom();
            })
          }),
          Divider(),
          _createDrawerItem(
              icon: Icons.info_outline,
              text: 'Über diese App',
              onTap: () => {
                setState(() {
                  content = AboutContainer();
                })
              }
          ),
          Divider(),
          ListTile(
            title: Text('Wissen Macht Politk v.1.0.0'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/img/banner.jpg')
            )),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("Wissen Macht Politik",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }




}