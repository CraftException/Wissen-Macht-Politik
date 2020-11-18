import 'package:http/http.dart' as http;
import 'dart:convert';

class InfoRequestHandler {

  static Future<List<Info>> getInfos (String requesturl) async {

    List<Info> info = [];
    final response = await http.get(requesturl + "getinfo");

    if (response.statusCode == 200 && response.body.startsWith("[")) {
      jsonDecode(response.body).forEach((e) => {
        info.add(Info.fromJson(e))
      });
      return info;
    } else {
      return [];
    }
  }

}

class Info {

  String header;
  String description;
  String image;

  Info({this.header, this.description, this.image});

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      header: json['header'],
      description: json['desc'],
      image: json['img'],
    );
  }


}