import 'package:flutter/material.dart';
import 'package:flutter_rss/models/parser.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter_rss/widgets/loading.dart';
import 'package:flutter_rss/models/dateConverter.dart';

class Detail extends StatefulWidget {
  RssItem item;

  Detail(RssItem feed) {
    this.item = item;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Show Title"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Text(item.author ?? ''),
            new Text(
              new DateConverter().converterDate(item.pubDate ?? ''), 
              style: TextStyle(
                color: Colors.red
              ),
            ),
            new Text(
              item.title ?? '', 
              textAlign: TextAlign.center,
            ),
            new Card(
              elevation: 7.5,
              child: new Container(
                width: MediaQuery.of(context).size.width / 2.5,
                child: new Image.network(
                  item.enclosure.url  ?? 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/Empty_set.svg/400px-Empty_set.svg.png' ,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}