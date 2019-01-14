import 'package:flutter/material.dart';
import 'package:flutter_rss/widgets/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Rss',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Home(title: 'Flutter Rss'),
    );
  }
}