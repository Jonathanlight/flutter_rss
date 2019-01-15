import 'package:flutter/material.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_rss/models/dateConverter.dart';
import 'package:flutter_rss/widgets/detail.dart';

class Grille extends StatefulWidget {
  RssFeed feed;

  Grille(RssFeed feed) {
    this.feed = feed;
  }

  @override
  _GrilleState createState() => _GrilleState();
}

class _GrilleState extends State<Grille> {

  @override
  Widget build(BuildContext context) {
    return new GridView.builder(
      itemCount: widget.feed.items.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, i) {
          RssItem item = widget.feed.items[i];
          return new InkWell(
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (BuildContext context) {
                    return new Detail(item);
                  }
                )
              );
            },
            child: new Card(
              elevation: 10.0,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
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
                  )
                ],
              ),
            ),
          );
        }
    );
  }
}