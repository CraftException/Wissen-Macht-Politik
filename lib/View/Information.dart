import 'package:flutter/material.dart';

class Information extends StatefulWidget {
  @override
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Information> with AutomaticKeepAliveClientMixin<Information> {
  @override
  void initState() {
    super.initState();
    print('initState Tab1');
  }

  @override
  Widget build(BuildContext context) {
    print('build Tab1');
    return Scaffold(

      body: Center(
        child: Text(
          'This is content of Tab1',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}