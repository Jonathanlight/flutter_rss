import 'package:flutter/material.dart';
import 'package:flutter_rss/models/parser.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter_rss/widgets/loading.dart';
import 'package:flutter_rss/widgets/list.dart';
import 'package:flutter_rss/widgets/grille.dart';


class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  RssFeed feed;

  @override
  void initState(){
    super.initState();
    parse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                feed = null;
                parse();
              });
            },
          )
        ],
      ),
      body: mainBody(),
    );
  }

  Widget mainBody() {
    if (feed == null) {
      return new Loading();
    } else {
      Orientation orientation = MediaQuery.of(context).orientation;
      if (orientation == Orientation.portrait) {
        //List
        return new List(feed);
      } else {
        // Grille
        return new Grille(feed);
      }
    }
  }

  Future<Null> parse() async {
    RssFeed recu = await Parser().chargeRSS();
    if (recu != null) {
      setState(() {
        feed = recu;
        print(feed.items.length);
        feed.items.forEach((feedItem) {
          RssItem item = feedItem;
        });
      });
    }
  }
}
