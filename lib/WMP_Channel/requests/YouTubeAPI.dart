import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube_api/youtube_api.dart';

class YoutubeDataAPI {

  static Future<List<String>> getVideos () async {

    List<String> videos = [];

    YoutubeAPI ytApi = new YoutubeAPI("AIzaSyD7Imrm7wi_mRLKSUgXsFko4aoPAjK-ZgI");
    await ytApi.channel("UC3OSxVUrgZDF7223ZYjLqdQ").then((value) => value.forEach((element) {
      try {
        videos.add(jsonDecode(element.id.toString()));
      } catch(e) {}
    }));

    print(videos);
    return videos;

  }

}