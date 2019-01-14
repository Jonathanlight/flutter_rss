import 'package:flutter/material.dart';
import 'package:flutter_rss/models/parser.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter_rss/widgets/loading.dart';
import 'package:flutter_rss/models/dateConverter.dart';

class Detail extends StatefulWidget {
  RssFeed feed;

  Detail(RssFeed feed) {
    this.feed = feed;
  }

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  @override
  Widget build(BuildContext context) {
  }
}