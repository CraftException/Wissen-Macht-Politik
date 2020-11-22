import 'dart:convert';

import 'package:http/http.dart' as http;

class BlogRequestHandler {

  static Future<List<BlogPosts>> getPosts (String requesturl, String posts) async {

    List<BlogPosts> blogpost = [];
    final response = await http.get(requesturl + "getposts?group=" + posts);

    if (response.statusCode == 200) {
      jsonDecode(response.body).forEach((e) => {
        blogpost.add(BlogPosts.fromJson(e))
      });
      return blogpost;
    } else {
      return [];
    }
  }

}

class BlogPosts {

  String header;
  String description;
  String image;

  String author;
  String date;

  BlogPosts({this.header, this.description, this.image, this.author, this.date});

  factory BlogPosts.fromJson(Map<String, dynamic> json) {
    return BlogPosts(
      header: json['header'],
      description: json['description'],
      image: json['image'],
      author: json['author'],
      date: json['date'],
    );
  }

}