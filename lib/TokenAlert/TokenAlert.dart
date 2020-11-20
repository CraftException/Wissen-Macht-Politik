
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:vertretungsplan_mobile/HelpingClass.dart';
import 'package:vertretungsplan_mobile/WMP_Channel/requests/VoteRequests.dart';

class TokenAlert {

  static void showTokenAlert (BuildContext context) async {

    final myControler = TextEditingController();
    final int points = await VoteRequests.getPoints("http://45.93.249.196:8081/");

    Alert(
      context: context,
      title: "Spendentoken einlösen",
      content: Column(
        children: [
          Text(
            "Mit dem Einlösen eines Spendentokens, welchen du auf dem Discord erhälst, gibt dir u.a. mehr Stimmen beim Voten",
            textAlign: TextAlign.center,
          ),
          Text(
            "\nAktuelle Stimmen: " + points.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(height: 1.4),
          ),
          TextField(
            controller: myControler,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              icon: Icon(Icons.lock),
              labelText: 'Token',
            ),
          )
        ],
      ),
        buttons: [
          DialogButton(
            onPressed: () async {
              final deviceUUID = await HelpingClass.getDeviceUUID();
              if (myControler.text != "") {
                if (await VoteRequests.useCode("http://45.93.249.196:8081/",
                    int.parse(myControler.text))) {
                  Alert(context: context,
                      title: "Vielen Dank!",
                      desc: "Dein Token wurde eingelöst. Wir bedanken uns für deine Spende!")
                      .show();
                } else {
                  Alert(context: context,
                      title: "Ein Fehler ist aufgetreten...",
                      desc: "Bitte überprüfe den Token!").show();
                }
              }
            },
            child: Text(
              "Einlösen!",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]
    ).show();
  }

}