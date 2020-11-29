import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:vertretungsplan_mobile/Blog/BlogRequests.dart';
import 'package:vertretungsplan_mobile/Blog/CovidRequests.dart';
import 'package:vertretungsplan_mobile/WMP_Channel/View/VoteAlert/VoteAlert.dart';
import 'package:vertretungsplan_mobile/WMP_Channel/requests/VoteRequests.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../HelpingClass.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin<HomePage> {

  String newestVideoID;
  CovidData global,germany;
  Vote newestVote;
  BlogPosts covid,news,denews;

  bool loaded;

  @override
  void initState() {
    super.initState();

    newestVideoID = "http://youtube.com/watch?v=unknown";

    global = null;
    germany = null;

    newestVote = null;

    covid = null;
    news = null;
    denews = null;

    loaded = false;

    HelpingClass.getNewestVideo().then((value) => setState(() => newestVideoID = value));

    CovidRequestHandler.getGlobal().then((value) => setState(() => global = value));
    CovidRequestHandler.getGermany().then((value) => setState(() => germany = value));

    VoteRequestHandler.getVotes("http://45.93.249.196:8081/").then((value) => setState(() => newestVote = value[value.length-1]));

    BlogRequestHandler.getPosts("http://45.93.249.196:8081/", "covid").then((value) => setState(() => {
      if (value.length > 0) {
        covid = value[value.length-1]
      }
    }));
    BlogRequestHandler.getPosts("http://45.93.249.196:8081/", "news").then((value) => setState(() => {
      if (value.length > 0) {
        news = value[value.length-1]
      }
    }));
    BlogRequestHandler.getPosts("http://45.93.249.196:8081/", "germany").then((value) => setState(() {
      if (value.length > 0) {
        denews = value[value.length-1]; 
        loaded = true;
      }      
    }));
 
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> homeWidgets = [];

    homeWidgets.add(_header());

    if (newestVideoID != null) {
      YoutubePlayerController _controller = YoutubePlayerController(
        initialVideoId: 'iLnmTe5Q2Qw',
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: true,
        ),
      );

      homeWidgets.add(YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
      ));

      }

    if (!(loaded))
      homeWidgets.add(new CircularProgressIndicator());
    else {
      homeWidgets.add(Center(child: Text("Neuigkeiten:", style: TextStyle(color: Colors.black54, fontSize: 24, height: 2.8),),));

      if (covid != null) 
        homeWidgets.add(_getBlogPostWidget(covid));

      if (news != null)         
        homeWidgets.add(_getBlogInfoWidget(news));

      if (denews != null)         
        homeWidgets.add(_getBlogPostWidget(denews));                  

      homeWidgets.add(Divider(thickness: 4, height: 25, color:  Colors.grey));
      homeWidgets.add(Center(child: Text("Neuste Umfrage:", style: TextStyle(color: Colors.black54, fontSize: 24, height: 2),),));

      if (newestVote != null) 
        homeWidgets.add(_getVoteWidget(newestVote));

    }

    return Scaffold(
      body: Center(
          child:
          SingleChildScrollView(
            child: Column(
              children: homeWidgets,
            ),
            primary: false,
          )
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

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

                child: Image.network("https://cdn.discordapp.com/icons/602523861023588352/3594ef0dc1f29fd2e5b1fa4457bcb228.webp?size=128", alignment: Alignment.center, width: MediaQuery.of(context).size.width * 0.2, height: MediaQuery.of(context).size.width * 0.2),
              ),
              Container(
                margin: EdgeInsets.only(left: 25),
                child:
                Column(
                  children: [
                    Text("Wilkommen!", style: TextStyle(fontSize: 23, height: 1.5), textAlign: TextAlign.center),
                    Text("Hier gibt es politische News und mehr!", style: TextStyle(fontSize: 14, height: 1.05), textAlign: TextAlign.center),
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

  Widget _getBlogInfoWidget (BlogPosts blogPosts) {

    String header = "";
    String color = "";
    String topic = "";

    try {
      header = blogPosts.header.split(".,")[0];
      color = blogPosts.header.split(".,")[2];
      topic = blogPosts.header.split(".,")[1];
    } catch(e) {
      header = "";
      color = "";
      topic = "";
    }

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
  
  Widget _getVoteWidget (Vote vote) {

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
          Text(vote.header, style: TextStyle(fontSize: 28, height: 1.5),),
          Image.network(vote.image, alignment: Alignment.center, width: MediaQuery.of(context).size.width * 0.4, height: MediaQuery.of(context).size.width * 0.4,),
          Text(vote.description, style: TextStyle(fontSize: 18, height: 1.4),),
          Column(
            children: [
              SizedBox(height: 30),
              RaisedButton(
                onPressed: () {
                  VoteAlert.showVoteAlert(vote, context);
                },
                child: const Text('Jetzt voten!', style: TextStyle(fontSize: 20)),
              ),
            ],
          )
        ],
      ),
    );
  }

}