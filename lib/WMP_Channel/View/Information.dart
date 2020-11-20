
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

    InfoRequestHandler.getInfos("http://45.93.249.196:8081/").then((value) => setState(() {
      information = value;
    }));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> informationWidget = [];

    informationWidget.add(_header());
    information.forEach((value) {
      informationWidget.add(_getInformationWidget(value.header, value.description, value.image));
    });

    if (informationWidget.length == 1)
      informationWidget.add(new CircularProgressIndicator());

    return Scaffold(

      body: Center(
        child:
            SingleChildScrollView(
              child: Column(
                children: informationWidget,
              ),
            )
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  Widget _getInformationWidget (String text, String description, String image) {
    return Container(
      margin: EdgeInsets.only(left: 0, top: 20, right: 0, bottom: 10),
      width: MediaQuery.of(context).size.width * 0.9,
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
          Text(text, style: TextStyle(fontSize: 28, height: 1.5),),
          Image.network(image, alignment: Alignment.center, width: MediaQuery.of(context).size.width * 0.4, height: MediaQuery.of(context).size.width * 0.4,),
          Text(description, style: TextStyle(fontSize: 18, height: 1.4),),
        ],
      ),
    );
  }

  Widget _header () {
    return Container(
      padding: EdgeInsets.all(11),
      decoration: BoxDecoration(

        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),


        ],
      ),
      child: Center(
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Image.network("https://pbs.twimg.com/profile_images/1252349508609966080/h0-6ZFd1.jpg", alignment: Alignment.center, width: MediaQuery.of(context).size.width * 0.2, height: MediaQuery.of(context).size.width * 0.2),
            ),
            Container(
              margin: EdgeInsets.only(left: 25),
              child:
              Column(
                children: [
                  Text("Informationen", style: TextStyle(fontSize: 23, height: 1.5), textAlign: TextAlign.center),
                  Text("Alles neue über den YT Kanal", style: TextStyle(fontSize: 14, height: 1.05), textAlign: TextAlign.center)
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}