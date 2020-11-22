import 'package:flutter/material.dart';
import 'package:vertretungsplan_mobile/WMP_Channel/View/VoteAlert/VoteAlert.dart';
import 'package:vertretungsplan_mobile/WMP_Channel/requests/VoteRequests.dart';

class Videoselect extends StatefulWidget {
  @override
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Videoselect> with AutomaticKeepAliveClientMixin<Videoselect> {

  List<Vote> votes = [];

  @override
  void initState() {
    super.initState();

    VoteRequestHandler.getVotes("http://45.93.249.196:8081/").then((value) => setState(() {
      votes = value;
    }));
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> voteWidget = [];

    voteWidget.add(_header());
    votes.forEach((element) {
      voteWidget.insert(1, _getVoteWidget(element));
    });

    if (voteWidget.length == 1)
      voteWidget.add(new CircularProgressIndicator());

    return Scaffold(
      body: Center(
          child:
          SingleChildScrollView(
            child: Column(
              children: voteWidget,
            ),
          )
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  Widget _getVoteWidget (Vote vote) {


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
          Text(vote.header, style: TextStyle(fontSize: 28, height: 1.5),),
          Image.network(vote.image, alignment: Alignment.center, width: MediaQuery.of(context).size.width * 0.4, height: MediaQuery.of(context).size.width * 0.4,),
          Text(vote.description, style: TextStyle(fontSize: 18, height: 1.4),),
          Column(
            children: [
              SizedBox(height: 30),
              RaisedButton(
                onPressed: () {
                  VoteAlert.showVoteAlert(vote, context);
                },
                child: const Text('Jetzt voten!', style: TextStyle(fontSize: 20)),
              ),
            ],
          )
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
                child: Image.network("https://i.imgur.com/yJt6Smz.png", alignment: Alignment.center, width: MediaQuery.of(context).size.width * 0.2, height: MediaQuery.of(context).size.width * 0.2),
              ),
              Container(
                margin: EdgeInsets.only(left: 25),
                child:
                Column(
                  children: [
                    Text("Umfragen und Co.", style: TextStyle(fontSize: 23, height: 1.5), textAlign: TextAlign.center),
                    Text("Du darfst mit entscheiden!", style: TextStyle(fontSize: 14, height: 1.05), textAlign: TextAlign.center)
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}