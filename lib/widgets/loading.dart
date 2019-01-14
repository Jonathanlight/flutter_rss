import 'package:flutter/material.dart';
import 'package:flutter_rss/widgets/list.dart';

class Loading extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text('Loading ...'),
          Image.asset('assets/img/loading.gif')
        ],
      ),
    );
  }
}