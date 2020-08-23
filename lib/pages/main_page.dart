import 'package:GenerationBridgeMobile/pages/call_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.red[100],
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red[300],
                  ),
                ),
              ),
            ),
          ),
          RaisedButton(
            child: Text('접속'),
            color: Colors.orange,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CallPage(
                    channelName: _textEditingController.text,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
