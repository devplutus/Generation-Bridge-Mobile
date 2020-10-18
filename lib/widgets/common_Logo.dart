import 'package:flutter/material.dart';

class CommonLogo extends StatelessWidget {
  var _opacity = 0.0;

  CommonLogo(this._opacity);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: AnimatedOpacity(
            opacity: _opacity,
            duration: Duration(seconds: 1),
            child: Image(
              image: AssetImage('lib/assets/images/GB_LOGO.png'),
            ),
          ),
        ),
      ],
    );
  }
}
