import 'package:GenerationBridgeMobile/models/GenerationBridgeUser.dart';
import 'package:GenerationBridgeMobile/pages/call/call_page.dart';
import 'package:GenerationBridgeMobile/pages/main/settings_page.dart';
import 'package:GenerationBridgeMobile/providers/_userInfoProvider.dart';
import 'package:GenerationBridgeMobile/utils/call_utils.dart';
import 'package:GenerationBridgeMobile/utils/lib.dart';
import 'package:GenerationBridgeMobile/widgets/call_page_stream_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> pageList = [
    HomePage(),
    Container(),
    Container(),
    SettingsPage()
  ];

  PageController _pageController = PageController();

  int pageIndex = 0;

  Widget _widgetMainLogo() {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 45),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35.0),
          bottomRight: Radius.circular(35.0),
        ),
      ),
      child: Center(
        child: RichText(
          text: TextSpan(
            text: 'G',
            style: TextStyle(
              color: HexColor('#30459A'),
              fontSize: 18,
              letterSpacing: 3.0,
            ),
            children: [
              TextSpan(
                text: 'eneration ',
                style: TextStyle(color: Colors.white),
              ),
              TextSpan(text: 'B'),
              TextSpan(
                text: 'ridge',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _widgetBottomNavigationBar() {
    return BottomNavigationBar(
      iconSize: 25.0,
      unselectedFontSize: 15.0,
      type: BottomNavigationBarType.fixed,
      currentIndex: pageIndex,
      onTap: (index) {
        setState(() {
          pageIndex = index;
          _pageController.animateToPage(index,
              duration: Duration(
                milliseconds: 500,
              ),
              curve: Curves.easeOut);
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.group_add),
          label: '새짝꿍',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          label: '게시판',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: '설정',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CallPageStreamLayout(
      scaffold: Scaffold(
        body: Column(
          children: [
            _widgetMainLogo(),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.white,
                child: PageView(
                  pageSnapping: false,
                  controller: _pageController,
                  children: pageList,
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: _widgetBottomNavigationBar(),
      ),
    );
  }
}
