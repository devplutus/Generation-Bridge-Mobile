import 'package:GenerationBridgeMobile/utils/lib.dart';
import 'package:GenerationBridgeMobile/widgets/init_page_quickguide.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class InitPage extends StatefulWidget {
  @override
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  Widget _widgetHeader() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.27,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: HexColor('#FF7979'),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: Offset(0, 3),
                )
              ]),
        ),
        Positioned(
          bottom: 10,
          child: Column(
            children: [
              Image(
                width: MediaQuery.of(context).size.width * 0.45,
                image: AssetImage('lib/assets/images/GB_LOGO.png'),
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'G',
                    style: TextStyle(
                      color: HexColor('#30459A'),
                      fontSize: 24,
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
              Padding(padding: EdgeInsets.only(top: 10)),
              Text(
                '세대간 연결 다리',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _widgetLoginButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      height: 60,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: HexColor('#FF7979'), width: 3),
        ),
        textColor: HexColor('#FF7979'),
        color: Colors.white,
        onPressed: pushToLoginPage,
        child: Text(
          '로그인',
          style: TextStyle(
            fontSize: 17,
          ),
        ),
      ),
    );
  }

  Widget _widgetSignupButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      height: 60,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        textColor: Colors.white,
        color: HexColor('#FF7979'),
        onPressed: pushToSignupPage,
        child: Text(
          '회원가입',
          style: TextStyle(
            fontSize: 17,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            _widgetHeader(),
            Padding(padding: EdgeInsets.only(top: 70.0)),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 220.0,
              child: InitPageQuickGuide(),
            ),
            Padding(padding: EdgeInsets.only(top: 40.0)),
            _widgetLoginButton(),
            Padding(padding: EdgeInsets.symmetric(vertical: 25)),
            _widgetSignupButton(),
            Padding(padding: EdgeInsets.symmetric(vertical: 15)),
            Text(
              '현재는 Email 인증만 가능합니다.',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  void pushToLoginPage() {
    Navigator.pushNamed(context, '/Login');
  }

  void pushToSignupPage() {
    Navigator.pushNamed(context, '/Signup1');
  }
}
