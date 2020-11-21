import 'dart:convert';
import 'dart:html';

import 'package:http/http.dart' as http;
import 'package:vertretungsplan_mobile/HelpingClass.dart';

class VoteRequests {

  static Future<bool> init (String requesturl) async {

    final deviceuuid = await HelpingClass.getDeviceUUID();
    final response = await http.get(requesturl + "registerifnotexists?uniqueid=" + deviceuuid);

    if (!(response.body.startsWith("0"))) {
      return false;
    } else {
      return true;
    }

  }

  static Future<int> getPoints (String requesturl) async {
    final deviceuuid = await HelpingClass.getDeviceUUID();
    final response = await http.get(requesturl + "getpoints?uniqueid=" + deviceuuid);

    if (response.body.startsWith("-1")) {
      return -1;
    } else {
      return int.parse(response.body);
    }
  }

  static Future<bool> useCode (String requesturl, int code) async {
    final deviceuuid = await HelpingClass.getDeviceUUID();
    final response = await http.get(requesturl + "usecode?uniqueid=" + deviceuuid + "&code=" + code.toString());

    if (response.body.startsWith("-1") || response.body.startsWith("-2")) {
      return false;
    } else {
      return true;
    }
  }

  static Future<List<Vote>> getVotes (String requesturl) async {

    List<Vote> votes = [];
    final response = await http.get(requesturl + "getvotes");

    if (response.statusCode == 200) {
      jsonDecode(response.body).forEach((e) => {
        votes.add(Vote.fromJson(e))
      });
      return votes;
    } else {
      return [];
    }
  }

  static Future<bool> hasVoted (String requesturl, String headline) async {
    final deviceuuid = await HelpingClass.getDeviceUUID();
    final response = await http.get(requesturl + "hasvoted?uniqueid=" + deviceuuid + "&voteheader=" + headline.toString());

    if (response.statusCode == 200 && !(response.body == "-1")) {
      if (response.body.toLowerCase().startsWith("true")) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

}

class Vote {

  Type type;
  String header;
  String description;
  String image;

  List<String> choices;

  Vote({this.type, this.header, this.description, this.image, this.choices});

  factory Vote.fromJson(Map<String, dynamic> json) {
    return Vote(
      description: json['desc'],
      header: json['header'],
      type: json['type'],
      image: json['img'],
      choices: json['choices'],
    );
  }

}

enum Type {
  CHOICE, SELECT
}