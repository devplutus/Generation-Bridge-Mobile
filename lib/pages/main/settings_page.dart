import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

Widget _widgetCard(List<Widget> widgets, {double height = 110.0}) {
  return Container(
    padding: EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 20.0,
    ),
    height: height,
    width: double.infinity,
    margin: EdgeInsets.only(
      bottom: 40,
    ),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: Colors.grey[400]),
        boxShadow: [
          BoxShadow(color: Colors.grey[400], spreadRadius: 1, blurRadius: 7)
        ]),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [...widgets],
    ),
  );
}

Widget _widgetCurrentVolunteer(context) {
  return _widgetCard([
    Text('진행 중인 봉사 시간'),
    Padding(padding: EdgeInsets.symmetric(vertical: 10)),
    Container(
      height: 20.0,
      child: Stack(
        children: [
          LinearProgressIndicator(
            value: 0.7,
            minHeight: 20,
            backgroundColor: Colors.red[100],
            valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor),
          ),
          Positioned(
            top: 1,
            left: MediaQuery.of(context).size.width * 0.3 + 18,
            child: Text(
              '40분',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ],
      ),
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [Text('40분 / 60분', style: TextStyle(fontSize: 17))],
    ),
  ]);
}

Widget _widgetTotalVolunteer(context) {
  return _widgetCard([
    Text(
      '총 인정 봉사 시간',
    ),
    Padding(padding: EdgeInsets.symmetric(vertical: 10)),
    Text(
      '4 시간',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    Padding(padding: EdgeInsets.symmetric(vertical: 10)),
    DefaultTextStyle(
      style: TextStyle(
        color: Colors.grey[700],
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('*'),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: Image(
                  width: MediaQuery.of(context).size.width * 0.3,
                  image: AssetImage('lib/assets/images/1365_LOGO.png'),
                ),
              ),
              Text('연계하여 1시간 단위로')
            ],
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 2)),
          Text('인정되며, 차일 업데이트 됩니다.')
        ],
      ),
    )
  ], height: 160);
}

Widget _getSettingsButton(context, title, onPressed) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 45,
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[300]),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300],
            blurRadius: 3,
            spreadRadius: 1,
          )
        ]),
    child: FlatButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18.0,
          // color: Theme.of(context).primaryColor,
          color: Colors.black,
        ),
      ),
    ),
  );
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        color: Colors.grey[900],
        fontSize: 20,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 30.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            _widgetCurrentVolunteer(context),
            _widgetTotalVolunteer(context),
            _getSettingsButton(context, '내 정보 관리', () {}),
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            _getSettingsButton(context, '양로원 경로당 정보보기', () {}),
            Padding(padding: EdgeInsets.symmetric(vertical: 15)),
            _getSettingsButton(context, 'Generation Bridge 소개', () {}),
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            _getSettingsButton(context, '이용 안내', () {}),
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            _getSettingsButton(context, '질문 / 제안 (FAQ / 1:1문의)', () {}),
          ],
        ),
      ),
    );
  }
}
