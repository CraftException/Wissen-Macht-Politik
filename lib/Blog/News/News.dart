import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:vertretungsplan_mobile/Blog/BlogRequests.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> with AutomaticKeepAliveClientMixin<News> {

  String searchQuery;
  List<BlogPosts> posts = [];
  bool loaded;

  @override
  void initState() {
    super.initState();
    loaded = false;

    BlogRequestHandler.getPosts("http://45.93.249.196:8081/", "news").then((value) =>
      setState(() {
        posts = value;
        loaded = true;  
      })
    );

  }

  @override
  Widget build(BuildContext context) {

    List<Widget> postWidget = [];

    postWidget.add(_header());

    posts.forEach((value) {
      postWidget.add(_getBlogPostWidget(value));
    });

    if (postWidget.length == 1 && !(loaded))
      postWidget.add(new CircularProgressIndicator());

    return Scaffold(
      body: Center(
          child:
          SingleChildScrollView(
            child: Column(
              children: postWidget,
            ),
            primary: false,
          )
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  Widget _getBlogPostWidget (BlogPosts blogPosts) {

    String header = blogPosts.header.split(".,")[0];
    String color = blogPosts.header.split(".,")[2];
    String topic = blogPosts.header.split(".,")[1];

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
          Text(header, style: TextStyle(fontSize: 28, height: 1.5),),
          Text(topic, style: TextStyle(fontSize: 20,backgroundColor: Color.fromARGB(255, int.parse(color.split(";")[0]), int.parse(color.split(";")[1]), int.parse(color.split(";")[2])))),
          Image.network(blogPosts.image, alignment: Alignment.center, width: MediaQuery.of(context).size.width * 0.4, height: MediaQuery.of(context).size.width * 0.4,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.person, color: Colors.blueGrey),
              Text(blogPosts.author, style: TextStyle(fontSize: 14, height: 1.4, color: Colors.blueGrey),),
              Icon(Icons.access_time, color: Colors.blueGrey),
              Text(blogPosts.date, style: TextStyle(fontSize: 14, height: 1.7, color: Colors.blueGrey),)
            ],
          ),
          ReadMoreText(
            blogPosts.description + "",
            trimLength: 100,
            colorClickableText: Colors.blueGrey,
            trimMode: TrimMode.Length,
            trimCollapsedText: 'Mehr lesen',
            trimExpandedText: 'Weniger Lesen',
            textAlign: TextAlign.center,
            moreStyle: TextStyle(fontSize: 18, height: 1.4),
          ),
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

                child: Image.network("https://www.graphicsprings.com/filestorage/stencils/7b3e911c651a162c91af9f10a7cc16d3.png?width=500&height=500", alignment: Alignment.center, width: MediaQuery.of(context).size.width * 0.2, height: MediaQuery.of(context).size.width * 0.2),
              ),
              Container(
                margin: EdgeInsets.only(left: 25),
                child:
                Column(
                  children: [
                    Text("News", style: TextStyle(fontSize: 23, height: 1.5), textAlign: TextAlign.center),
                    Text("Hier siehst du aktuelle Politische Infos!", style: TextStyle(fontSize: 14, height: 1.05), textAlign: TextAlign.center),
                    Container(
                      margin: EdgeInsets.only(left: 25.0, top: 25.0, right: 25.0),

                    ),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }

}