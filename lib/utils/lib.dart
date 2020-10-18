import 'dart:ui';

import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class UtilLibrary {
  static void alertDialog(context, title) {
    showDialog<void>(
        context: context,
        useSafeArea: true,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            elevation: 10.0,
            title: Center(child: Text(title)),
            titleTextStyle: TextStyle(fontSize: 15, color: Colors.black),
            titlePadding: EdgeInsets.only(top: 50, bottom: 20),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      '확인',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35.0)),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
