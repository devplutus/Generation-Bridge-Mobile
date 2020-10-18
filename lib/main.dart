import 'package:GenerationBridgeMobile/pages/call/call_screen.dart';
import 'package:GenerationBridgeMobile/pages/call/call_page.dart';
import 'package:GenerationBridgeMobile/pages/sign/init_page.dart';
import 'package:GenerationBridgeMobile/pages/sign/login_page.dart';
import 'package:GenerationBridgeMobile/pages/main/main_page.dart';
import 'package:GenerationBridgeMobile/pages/call/pickup_screen.dart';
import 'package:GenerationBridgeMobile/pages/sign/signup_step1_page.dart';
import 'package:GenerationBridgeMobile/pages/sign/signup_step2_page.dart';
import 'package:GenerationBridgeMobile/pages/splash_page.dart';
import 'package:GenerationBridgeMobile/providers/_signupProvider.dart';
import 'package:GenerationBridgeMobile/providers/_userInfoProvider.dart';
import 'package:GenerationBridgeMobile/utils/lib.dart';
import 'package:animations/animations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(GenerationBridge());

class GenerationBridge extends StatelessWidget {
  PageRouteBuilder transictionPageRouteBuild(Widget page,
      {int milliseconds = 1000}) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionDuration: Duration(milliseconds: milliseconds),
      transitionsBuilder: (_, animation, secondaryAnimation, child) {
        return SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
          transitionType: SharedAxisTransitionType.horizontal,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserInfoProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignupProvider(),
        ),
      ],
      child: MaterialApp(
        home: SplashScreen(),
        theme: ThemeData(
          fontFamily: 'NotoSansCJKkr',
          primaryColor: HexColor('#FF7979'),
          hoverColor: HexColor('#FDCDCD'),
        ),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/init':
              return transictionPageRouteBuild(InitPage());
              break;
            case '/Login':
              return transictionPageRouteBuild(LoginPage());
              break;
            case '/Signup1':
              return transictionPageRouteBuild(SignUpStep1Page());
              break;
            case '/Signup2':
              return transictionPageRouteBuild(SignUpStep2Page());
              break;
            case '/Main':
              return transictionPageRouteBuild(MainPage());
              break;
            case '/Call/Pickup':
              return transictionPageRouteBuild(
                  PickupScreen(call: settings.arguments));
              break;
            case '/Call/Start':
              return PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    CallScreen(call: settings.arguments),
              );
              break;
            default:
          }
        },
      ),
    );
  }
}
