import 'package:flutter/material.dart';

class SignUpPageStep extends StatelessWidget {
  int step = 0;
  SignUpPageStep({this.step = 0});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List<Widget>.generate(4, (index) {
        return Row(
          children: [
            CircleAvatar(
              backgroundColor: this.step == index
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).hoverColor,
              radius: 5.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
            ),
          ],
        );
      }).toList(),
    );
  }
}
