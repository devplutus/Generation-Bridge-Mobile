import 'package:GenerationBridgeMobile/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/_counter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => Counter(),
        child: MyHome(),
      ),
    );
  }
}

class MyHome extends StatelessWidget {
  MyHome({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GenerationBridge"),
      ),
      body: MainPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Provider.of<Counter>(context, listen: false).incrementCount(),
        child: Icon(Icons.plus_one),
      ),
    );
  }
}
