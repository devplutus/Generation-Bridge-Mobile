import 'dart:async';

import 'package:GenerationBridgeMobile/utils/lib.dart';
import 'package:GenerationBridgeMobile/widgets/common_Logo.dart';
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
    Navigator.of(context).pushNamed('/init');
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
      color: Theme.of(context).primaryColor,
      child: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: Duration(seconds: 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Image(
                  image: AssetImage('lib/assets/images/GB_LOGO.png'),
                ),
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'G',
                    style: TextStyle(
                      color: HexColor('#30459A'),
                      fontSize: 28,
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
            ],
          ),
        ),
      ),
    );
  }
}
