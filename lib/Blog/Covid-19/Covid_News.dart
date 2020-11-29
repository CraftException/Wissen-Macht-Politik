import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:vertretungsplan_mobile/Blog/BlogRequests.dart';

import '../CovidRequests.dart';

class CovidNews extends StatefulWidget {
  @override
  _CovidNewsState createState() => _CovidNewsState();
}

class _CovidNewsState extends State<CovidNews> with AutomaticKeepAliveClientMixin<CovidNews> {

  List<BlogPosts> posts = [];
  bool loaded;

  @override
  void initState() {
    super.initState();
    loaded = false;

      BlogRequestHandler.getPosts("http://45.93.249.196:8081/", "covid").then((value) =>
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
          Text(blogPosts.header, style: TextStyle(fontSize: 28, height: 1.5),),
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
    CovidData dataGlobal = CovidData();
    CovidRequestHandler.getGlobal().then((value) =>
      setState(() => {
        dataGlobal = value
      })
    );

    CovidData dataDE = CovidData();
    CovidRequestHandler.getGlobal().then((value) =>
      setState(() => {
        dataDE = value
      })
    );

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

                child: Image.network("https://static.wixstatic.com/media/38def2_8584e289dd9a485880ec6b72cee1e8e4~mv2.png", alignment: Alignment.center, width: MediaQuery.of(context).size.width * 0.2, height: MediaQuery.of(context).size.width * 0.2),
              ),
              Container(
                margin: EdgeInsets.only(left: 25),
                child:
                Column(
                  children: [
                    Text("Covid-19", style: TextStyle(fontSize: 23, height: 1.5), textAlign: TextAlign.center),
                    Text("Alles neue über die Pandemie", style: TextStyle(fontSize: 14, height: 1.05), textAlign: TextAlign.center),
        
                  ],
                ),
              )
            ],
          ),
        )
    );
  }

}
//Row: | | |; Column: - _ 