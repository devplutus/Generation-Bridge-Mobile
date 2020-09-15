import 'package:GenerationBridgeMobile/utils/lib.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();

  final TextStyle subTitleStyle = TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.bold,
  );

  bool _isSave = false;

  Widget _widgetMainLogo() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.62,
      child: Image(
        image: AssetImage('lib/assets/images/GB_LOGO.png'),
      ),
    );
  }

  Widget _widgetLoginFormTitle() {
    return Text(
      '로그인',
      style: TextStyle(
          color: HexColor('#FF7979'),
          fontSize: 27,
          fontWeight: FontWeight.bold),
    );
  }

  Widget _widgetLoginFormEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('이메일', style: subTitleStyle),
        SizedBox(height: 5.0),
        TextField(
          controller: _emailEditingController,
          style: TextStyle(fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            hintText: 'GenerationBridge@google.co.kr',
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 3),
            ),
          ),
        ),
      ],
    );
  }

  Widget _widgetLoginFormPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('비밀번호', style: subTitleStyle),
        TextField(
          controller: _passwordEditingController,
          style: TextStyle(fontWeight: FontWeight.bold),
          obscureText: true,
          decoration: InputDecoration(
            hintText: '******',
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 3),
            ),
          ),
        ),
      ],
    );
  }

  Widget _widgetLoginFormSave() {
    return Row(
      children: [
        Checkbox(
          value: _isSave,
          onChanged: (value) {
            setState(() {
              _isSave = !_isSave;
            });
          },
          checkColor: Colors.white,
          activeColor: HexColor('#FF7979'),
        ),
        Text(
          '로그인 정보 저장',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ],
    );
  }

  Widget _widgetLoginButton() {
    return Container(
      width: double.infinity,
      height: 50.0,
      child: RaisedButton(
        onPressed: () {},
        child: Text(
          '로그인',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        color: HexColor('#FF7979'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#FF7979'),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(top: 30)),
              _widgetMainLogo(),
              Padding(padding: EdgeInsets.only(top: 60)),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.6,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Column(
                  children: [
                    _widgetLoginFormTitle(),
                    SizedBox(height: 30.0),
                    _widgetLoginFormEmail(),
                    SizedBox(height: 50.0),
                    _widgetLoginFormPassword(),
                    SizedBox(height: 20.0),
                    _widgetLoginFormSave(),
                    SizedBox(height: 60.0),
                    _widgetLoginButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
