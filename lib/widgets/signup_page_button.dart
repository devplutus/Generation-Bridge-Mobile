import 'package:GenerationBridgeMobile/utils/lib.dart';
import 'package:flutter/material.dart';

class SignUpPageButton extends StatefulWidget {
  Function onPressed = () {};
  String buttonText = '';
  Color backgroundColor = HexColor('#30459A');
  Color textColor = Colors.white;
  bool disabled = false;
  double width = 0.0;

  SignUpPageButton(
      {this.onPressed,
      this.buttonText,
      this.backgroundColor,
      this.textColor,
      this.disabled,
      this.width});

  @override
  _SignUpPageButtonState createState() => _SignUpPageButtonState();
}

class _SignUpPageButtonState extends State<SignUpPageButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: widget.width == null
            ? MediaQuery.of(context).size.width
            : widget.width,
        child: RaisedButton(
          onPressed: widget.disabled == true ? null : widget.onPressed,
          padding: EdgeInsets.symmetric(
            vertical: 18.0,
          ),
          child: Text(
            widget.buttonText,
            style: TextStyle(fontSize: 18.0),
          ),
          color: widget.backgroundColor,
          textColor: widget.textColor,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
    );
  }
}
