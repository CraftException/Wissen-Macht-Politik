import 'dart:convert';

import 'package:http/http.dart' as http;

class CovidRequestHandler {

    static Future<CovidData> getGlobal () async {

        CovidData covidData;
        final response = await http.get("https://api.covid19api.com/summary");

        if (response.statusCode == 200) {
          if (jsonDecode(response.body)['Message'] == "") {
            covidData = CovidData.fromJson(
              jsonDecode(response.body)['Global']
            );
          } else {
            covidData = null;
          }
        } else {
          covidData = null;
        }

        return covidData;

    }

    static Future<CovidData> getGermany () async {

        CovidData covidData;
        final response = await http.get("https://api.covid19api.com/summary");

        if (response.statusCode == 200) {
          if (jsonDecode(response.body)['Message'] == "") {
            var tagsJson = jsonDecode(response.body)['tags'];
            List<String> countries = tagsJson != null ? List.from(tagsJson) : null;

            covidData = CovidData.fromJson(
              jsonDecode(countries.where((element) => jsonDecode(element)['Country']).first)
            );
          } else {
            covidData = null;
          }
        } else {
          covidData = null;
        }

        return covidData;

    }

}

class CovidData {

  int newConfirmed = -1;
  int totalConfirmed = -1;
  int newDeath = -1;
  int totalDeath = -1;
  int newRecovered = -1;
  int totalRecovered = -1;

  CovidData({this.newConfirmed, this.totalConfirmed, this.newDeath, this.totalDeath, this.newRecovered, this.totalRecovered});

  factory CovidData.fromJson(Map<String, dynamic> json) {
    return CovidData(
      newConfirmed: json['newConfirmed'],
      totalConfirmed: json['totalConfirmed'],
      newDeath: json['newDeath'],
      totalDeath: json['totalDeath'],
      newRecovered: json['newRecovered'],
      totalRecovered: json['totalRecovered']
    );
  }

}