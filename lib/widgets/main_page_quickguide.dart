import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MainPageQuickGuide extends StatelessWidget {
  final Map<String, Color> colors = {
    'test': Colors.redAccent[100],
    'test2': Colors.black,
    'test3': Colors.greenAccent[50],
    'test4': Colors.blueAccent[200],
    'test5': Colors.indigoAccent[400]
  };

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
        reverse: false,
        enableInfiniteScroll: false,
        autoPlayInterval: Duration(seconds: 2),
      ),
      items: getCarouselList(),
    );
  }

  List<Widget> getCarouselList() {
    return colors.keys
        .map(
          (e) => Container(
            child: Text(e),
            color: colors[e],
          ),
        )
        .toList();
  }
}
