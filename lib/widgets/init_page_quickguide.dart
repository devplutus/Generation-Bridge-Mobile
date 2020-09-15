import 'package:GenerationBridgeMobile/utils/lib.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class InitPageQuickGuide extends StatefulWidget {
  @override
  _InitPageQuickGuideState createState() => _InitPageQuickGuideState();
}

class _InitPageQuickGuideState extends State<InitPageQuickGuide> {
  TextStyle getRegularStyle() {
    return TextStyle(
      color: HexColor('#30459A'),
      fontFamily: 'NotoSansCJKkr',
      fontSize: 20,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle getBoldStyle() {
    return TextStyle(
      color: HexColor('#30459A'),
      fontFamily: 'NotoSansCJKkr',
      height: 1.5,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    );
  }

  double iconSize = 70;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 220.0,
        aspectRatio: 2.3,
        autoPlay: true,
        reverse: false,
        enableInfiniteScroll: false,
        autoPlayInterval: Duration(seconds: 4),
        enlargeCenterPage: true,
      ),
      items: getCarouselList(),
    );
  }

  List<Widget> getCarouselList() {
    List<List<Widget>> widgets = [
      [
        Icon(
          FontAwesome5Solid.book,
          size: iconSize,
          color: HexColor('#30459A'),
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 30)),
        RichText(
          text: TextSpan(
            text: '당신의 ',
            style: getRegularStyle(),
            children: [
              TextSpan(
                text: '이야기',
                style: getBoldStyle(),
              ),
              TextSpan(text: '를 담아주세요.')
            ],
          ),
        ),
      ],
      [
        Icon(
          FontAwesome5Solid.paper_plane,
          size: iconSize,
          color: HexColor('#30459A'),
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 20)),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: '함께할 그린이에게 ',
            style: getRegularStyle(),
            children: [
              TextSpan(
                text: '\r\n함께해요',
                style: getBoldStyle(),
              ),
              TextSpan(text: '를 보내세요.')
            ],
          ),
        ),
      ],
      [
        Icon(
          FontAwesome5Solid.handshake,
          size: iconSize,
          color: HexColor('#30459A'),
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 20)),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: '상대방도 당신에게 ',
            style: getRegularStyle(),
            children: [
              TextSpan(
                text: '\r\n함께해요',
                style: getBoldStyle(),
              ),
              TextSpan(text: '를 보내면 입양 성공.')
            ],
          ),
        ),
      ],
      [
        Icon(
          FontAwesome5Solid.heart,
          size: iconSize,
          color: HexColor('#30459A'),
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 20)),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Generation Bridge에서 \r\n연락을 하며 ',
            style: getRegularStyle(),
            children: [
              TextSpan(
                text: '우정',
                style: getBoldStyle(),
              ),
              TextSpan(text: '을 나눕니다.')
            ],
          ),
        ),
      ],
    ];

    return widgets
        .map(
          (e) => Column(
            children: e,
          ),
        )
        .toList();
  }
}
