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
      print("FALLBACK");
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

}