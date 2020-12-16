import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_api/youtube_api.dart';

class HelpingClass {

  static void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<bool> isOnline() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
  }

  static Future<String> getDeviceUUID() async {
    String identifier;
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        identifier = build.androidId;  //UUID for Android
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        identifier = data.identifierForVendor;  //UUID for iOS
      }
    } on PlatformException {
      print('Failed to get platform version');
    }

    return identifier.toString();
  }

  static Future<YT_API> getNewestVideo () async {
    String key = 'AIzaSyD7Imrm7wi_mRLKSUgXsFko4aoPAjK-ZgI';
    YoutubeAPI ytApi = new YoutubeAPI(key);
    List<YT_API> ytResult = await ytApi.channel("UC3OSxVUrgZDF7223ZYjLqdQ");

    return ytResult[0];
  }

}