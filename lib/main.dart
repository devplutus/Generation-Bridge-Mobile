import 'package:GenerationBridgeMobile/pages/call_page.dart';
import 'package:GenerationBridgeMobile/pages/login_page.dart';
import 'package:GenerationBridgeMobile/pages/main_page.dart';
import 'package:GenerationBridgeMobile/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(GenerationBridge());

class GenerationBridge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/SplashPage',
      routes: {
        '/': (context) => MainPage(),
        '/SplashPage': (context) => SplashScreen(),
        '/Main/CallPage': (context) => CallPage(),
        '/Login': (context) => LoginPage()
      },
    );
  }
}
