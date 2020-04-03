import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Refresh Indicator Demo"),
      ),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: ListView(
          children: _getItems(),
        ),
      ),
    );
  }

  List<Widget> _getItems() {
    var items = <Widget>[];

    for (int i = _count; i < _count + 5; i++) {
      var item = Column(
        children: <Widget>[
          ListTile(
            title: Text("Title $i"),
          ),
          Divider(
            height: 2.0,
          )
        ],
      );
      items.add(item);
    }
    return items;
  }

  Future<Null> _handleRefresh() async {
    Completer<Null> completer = Completer<Null>();
    Future.delayed(
      Duration(seconds: 2),
    ).then((_) {
      completer.complete();
      setState(() {
        _count += 6;
      });
    });
    return completer.future;

    //OR
    // await Future.delayed(
    //   Duration(seconds: 2),
    // );
    // setState(() {
    //   _count += 5;
    // });
  }
}
