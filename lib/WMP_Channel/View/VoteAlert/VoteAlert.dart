import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:vertretungsplan_mobile/WMP_Channel/requests/VoteRequests.dart';
import 'package:vertretungsplan_mobile/side_bar_navigation.dart';

class VoteAlert {

  static Future<void> showVoteAlert (Vote vote, BuildContext context) async {
    if (await VoteRequestHandler.hasVoted("http://45.93.249.196:8081/", vote.header)) {
      Alert(context: AppDrawer.scaffoldKey.currentContext,
          title: "Du hast bereits gevotet!",
          desc: "Vielen Dank!",
        buttons: []
      ).show();
    } else {
      if (vote.type == Type.SELECT) {
        final myControler = TextEditingController();
        Alert(
            context: AppDrawer.scaffoldKey.currentContext,
            title: "Voten",
            content: Column(
              children: [
                Text(
                  "Gebe jetzt deine Stimme für \"" + vote.header +
                      "\" ab! Was ist deine Meinung dazu?",
                  textAlign: TextAlign.center,
                ),
                TextField(
                  controller: myControler,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    icon: Icon(Icons.question_answer),
                    labelText: 'Deine Meinung?',
                  ),
                ),
              ],
            ),
            buttons: [
              DialogButton(
                onPressed: () async {
                  if (myControler.text != "" && !(await VoteRequestHandler.hasVoted("http://45.93.249.196:8081/", vote.header))) {
                    VoteRequestHandler.vote("http://45.93.249.196:8081/", vote.header, myControler.text.toString());
                    final int points = await VoteRequestHandler.getPoints("http://45.93.249.196:8081/");
                    Alert(context: AppDrawer.scaffoldKey.currentContext,
                        title: "Vielen Dank für deine Stimme!",
                        desc: "Deine Stimme zählt " + points.toString() + "-fach!",
                        buttons: []
                    ).show();
                  } else {
                    Alert(context: AppDrawer.scaffoldKey.currentContext,
                        title: "Du hast bereits gevotet!",
                        desc: "Vielen Dank!",
                        buttons: []
                    ).show();
                  }
                },
                child: Text(
                  "Bestätigen!",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            ]
        ).show();
      } else {

      }
    }
  }

}