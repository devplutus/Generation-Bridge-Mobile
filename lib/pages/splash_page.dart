import 'dart:async';

import 'package:GenerationBridgeMobile/utils/lib.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var _opacity = 0.0;
  startTime() async {
    await Timer(Duration(seconds: 1), setOpacity);
    Timer(Duration(seconds: 3), navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/');
  }

  void setOpacity() async {
    setState(() {
      _opacity = 1.0;
    });
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor('#FF7979'),
      child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: AnimatedOpacity(
            opacity: _opacity,
            duration: Duration(seconds: 1),
            child: Image(
              image: AssetImage('lib/assets/images/GB_LOGO.png'),
            ),
          ),
        ),
      ),
    );
  }
}
