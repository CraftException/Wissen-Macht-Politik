import 'package:flutter/material.dart';
import 'package:vertretungsplan_mobile/WMP_Channel/requests/InfoRequests.dart';

class Information extends StatefulWidget {
  @override
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Information> with AutomaticKeepAliveClientMixin<Information> {

  List<Info> information = [];

  @override
  void initState() {
    super.initState();

    InfoRequestHandler.getInfos("wmp.craftexception.de:8081").then((value) => setState(() => {
      value = information
    }));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> informationWidget = [];

    if (information == null)
      information = [];

    information.forEach((value) {
      informationWidget.add(_getInformationWidget(value.header, value.description, value.image));
    });

    return Scaffold(

      body: Center(
        child: Column(
          children: informationWidget,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  Widget _getInformationWidget (String text, String description, String image) {
    return Container(
      margin: EdgeInsets.only(left: 30, top: 100, right: 30, bottom: 50),
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Text(text, style: TextStyle(fontSize: 22, height: 1.5),),
          Image.network(image, alignment: Alignment.center, height: 1.6),
          Text(description, style: TextStyle(fontSize: 19, height: 1.4),),
        ],
      ),
    );
  }
}