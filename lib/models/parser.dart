import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class Parser {
  final url = "https://www.01net.com/rss/actualites/technos/";
  //"http://www.france24.com/fr/actualites/rss";
  // "https://www.01net.com/rss/actualites/technos/";

  Future chargeRSS() async {
    final reponse = await http.get(url);
    if (reponse.statusCode == 200) {
      final feed = new RssFeed.parse(reponse.body);
      return feed;
    } else {
      print("erreur: ${reponse.statusCode}");
    }
  }
}