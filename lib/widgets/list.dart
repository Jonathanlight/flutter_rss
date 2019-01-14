import 'package:flutter/material.dart';
import 'package:flutter_rss/models/parser.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter_rss/widgets/loading.dart';
import 'package:flutter_rss/models/dateConverter.dart';

class List extends StatefulWidget {
  RssFeed feed;

  List(RssFeed feed) {
    this.feed = feed;
  }

  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<List> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width / 2.5;

    return new ListView.builder(
      itemCount: widget.feed.items.length,
      itemBuilder: (context, i) {
        RssItem item = widget.feed.items[i];
        return new Container(
          child: new Card(
            elevation: 10.0,
            child: new InkWell(
              onTap: () {

              },
              child: new Column(
                children: <Widget>[
                  padding(),
                  new Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(item.author ?? ''),
                      new Text(
                        new DateConverter().converterDate(item.pubDate ?? ''), 
                        style: TextStyle(
                          color: Colors.red
                        ),
                      ),
                    ],
                  ),
                  padding(),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Card(
                        elevation: 7.5,
                        child: new Container(
                          width: size,
                          child: new Image.network(
                            item.enclosure.url  ?? 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/Empty_set.svg/400px-Empty_set.svg.png' ,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      new Container(
                        width: size,
                        child: new Text(item.description ?? ''),
                      )
                    ],
                  ),
                  padding(),
                ],
              ),
            )
          ),
          padding: EdgeInsets.only(
            right: 7.5,
            left: 7.5,
          ),
        );
      },
    );
  }

  Padding padding() {
    return new Padding(
      padding: EdgeInsets.only(
        top: 10.0,
      ),
    );
  }
}