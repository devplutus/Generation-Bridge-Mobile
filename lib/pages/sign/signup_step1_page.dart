import 'package:GenerationBridgeMobile/providers/_signupProvider.dart';
import 'package:GenerationBridgeMobile/utils/lib.dart';
import 'package:GenerationBridgeMobile/widgets/signup_page_button.dart';
import 'package:GenerationBridgeMobile/widgets/signup_page_step.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class SignUpStep1Page extends StatefulWidget {
  @override
  _SignUpStep1PageState createState() => _SignUpStep1PageState();
}

class _SignUpStep1PageState extends State<SignUpStep1Page> {
  ScrollController _scrollController =
      ScrollController(initialScrollOffset: 0.0);
  TextEditingController _nameEditingController = TextEditingController();
  TextEditingController _emailEditingController = TextEditingController();
  TextEditingController _passwordEditingController = TextEditingController();

  List<String> years = List<String>.generate(
      DateTime.now().year - 1900, (index) => (1900 + index).toString());
  List<String> months = List<String>.generate(
      12,
      (index) => index + 1 < 10
          ? "0" + (index + 1).toString()
          : (index + 1).toString());
  List<String> days = List<String>.generate(
      31,
      (index) => index + 1 < 10
          ? "0" + (index + 1).toString()
          : (index + 1).toString());
  List<String> citys = [
    '서울특별시',
    '부산광역시',
    '대구광역시',
    '인천광역시',
    '광주광역시',
    '대전광역시',
    '울산광역시',
    '세종특별자치시',
    '경기도',
    '강원도',
    '충청북도',
    '충청남도',
    '전라북도',
    '전라남도',
    '경상북도',
    '경상남도',
    '제주특별자치도'
  ];
  String year = '1990';
  String month = '01';
  String day = '01';
  String city = '서울특별시';
  String gender = 'M';

  Widget _widgetProfilePhoto() {
    return Center(
      child: Column(
        children: [
          GestureDetector(
            child: Container(
              width: 90.0,
              height: 90.0,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                      offset: Offset(1, 3),
                    )
                  ],
                  color: Theme.of(context).hoverColor,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Icon(
                FontAwesome5Solid.plus,
                color: Colors.grey[500],
                size: 35.0,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10.0)),
          Text('프로필 사진'),
        ],
      ),
    );
  }

  List<Widget> _widgetFormInputField(title, hintText, controller,
      {isPassword = false}) {
    return [
      Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
      Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
      TextField(
        style: TextStyle(fontSize: 15.0),
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      )
    ];
  }

  List<Widget> _widgetFormGender() {
    return [
      Text(
        '성별',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
      Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
          width: 140.0,
          child: RaisedButton(
            padding: EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 18.0,
            ),
            onPressed: () {
              setState(() {
                gender = 'M';
              });
            },
            child: Text(
              '남자',
              style: TextStyle(
                fontSize: 17.0,
                color: gender == 'M' ? Colors.white : Colors.black,
              ),
            ),
            color:
                gender == 'M' ? Theme.of(context).primaryColor : Colors.white,
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(15.0)),
          ),
        ),
        SizedBox(
          width: 140.0,
          child: RaisedButton(
            padding: EdgeInsets.symmetric(
              vertical: 15.0,
            ),
            onPressed: () {
              setState(() {
                gender = 'F';
              });
            },
            child: Text(
              '여자',
              style: TextStyle(
                fontSize: 17.0,
                color: gender == 'F' ? Colors.white : Colors.black,
              ),
            ),
            color:
                gender == 'F' ? Theme.of(context).primaryColor : Colors.white,
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
      ]),
    ];
  }

  void showComboBox(List<String> values, Function handler,
      FixedExtentScrollController scrollController) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              color: Color(0xffffffff),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: CupertinoButton(
                  child: Text('닫기'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            Container(
              height: 300.0,
              child: CupertinoPicker(
                backgroundColor: Colors.white,
                onSelectedItemChanged: handler,
                itemExtent: 40.0,
                children: values.map((e) => Center(child: Text(e))).toList(),
                scrollController: scrollController,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _widgetFormBirthYear() {
    return Row(
      children: [
        SizedBox(
          width: 90.0,
          child: RaisedButton(
            onPressed: () {
              FixedExtentScrollController _extentScrollController =
                  FixedExtentScrollController(initialItem: years.indexOf(year));
              showComboBox(years, (int index) {
                setState(() {
                  year = years[index];
                });
              }, _extentScrollController);
            },
            color: Colors.white,
            elevation: 0.0,
            padding: EdgeInsets.symmetric(
              vertical: 15.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  year,
                  style: TextStyle(fontSize: 17.0),
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 2.0)),
                Icon(Icons.arrow_drop_down_sharp)
              ],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: BorderSide(color: Colors.grey, width: 1.0),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.symmetric(horizontal: 3.0)),
        Text(
          '년',
          style: TextStyle(fontSize: 17.0),
        )
      ],
    );
  }

  Widget _widgetFormBirthMonth() {
    return Row(
      children: [
        SizedBox(
          width: 75.0,
          child: RaisedButton(
            onPressed: () {
              FixedExtentScrollController _extentScrollController =
                  FixedExtentScrollController(
                      initialItem: months.indexOf(month));
              showComboBox(months, (int index) {
                setState(() {
                  month = months[index];
                });
              }, _extentScrollController);
            },
            color: Colors.white,
            elevation: 0.0,
            padding: EdgeInsets.symmetric(
              vertical: 15.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  month,
                  style: TextStyle(fontSize: 17.0),
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 2.0)),
                Icon(Icons.arrow_drop_down_sharp)
              ],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: BorderSide(color: Colors.grey, width: 1.0),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.symmetric(horizontal: 3.0)),
        Text(
          '월',
          style: TextStyle(fontSize: 17.0),
        )
      ],
    );
  }

  Widget _widgetFormBirthDay() {
    return Row(
      children: [
        SizedBox(
          width: 75.0,
          child: RaisedButton(
            onPressed: () {
              FixedExtentScrollController _extentScrollController =
                  FixedExtentScrollController(initialItem: days.indexOf(day));
              showComboBox(days, (int index) {
                setState(() {
                  day = days[index];
                });
              }, _extentScrollController);
            },
            color: Colors.white,
            elevation: 0.0,
            padding: EdgeInsets.symmetric(
              vertical: 15.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  day,
                  style: TextStyle(fontSize: 17.0),
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 2.0)),
                Icon(Icons.arrow_drop_down_sharp)
              ],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: BorderSide(color: Colors.grey, width: 1.0),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.symmetric(horizontal: 3.0)),
        Text(
          '일',
          style: TextStyle(fontSize: 17.0),
        )
      ],
    );
  }

  List<Widget> _widgetFormBirth() {
    return [
      Text(
        '생년월일',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
      Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _widgetFormBirthYear(),
          _widgetFormBirthMonth(),
          _widgetFormBirthDay(),
        ],
      )
    ];
  }

  List<Widget> _widgetFormCity() {
    return [
      Text(
        '지역',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
      Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
      RaisedButton(
        onPressed: () {
          FixedExtentScrollController _extentScrollController =
              FixedExtentScrollController(initialItem: citys.indexOf(city));
          showComboBox(citys, (int index) {
            setState(() {
              city = citys[index];
            });
          }, _extentScrollController);
        },
        color: Colors.white,
        elevation: 0.0,
        padding: EdgeInsets.symmetric(
          vertical: 15.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              city,
              style: TextStyle(fontSize: 17.0),
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 2.0)),
            Icon(Icons.arrow_drop_down_sharp)
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Colors.grey, width: 1.0),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Colors.white,
            ),
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: SignUpPageStep(step: 0),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
                Scrollbar(
                  isAlwaysShown: true,
                  thickness: 7.0,
                  radius: Radius.circular(15.0),
                  controller: _scrollController,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _widgetProfilePhoto(),
                          Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
                          ..._widgetFormInputField('이메일', 'gbridge@google.com',
                              _emailEditingController),
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.0)),
                          ..._widgetFormInputField(
                              '비밀번호', '******', _passwordEditingController,
                              isPassword: true),
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.0)),
                          ..._widgetFormInputField(
                              '이름', '홍길동', _nameEditingController),
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.0)),
                          ..._widgetFormGender(),
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.0)),
                          ..._widgetFormBirth(),
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.0)),
                          ..._widgetFormCity(),
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 30.0)),
                          SignUpPageButton(
                            backgroundColor: HexColor('#30459A'),
                            textColor: Colors.white,
                            onPressed: () async {
                              var test = await Provider.of<SignupProvider>(
                                      context,
                                      listen: false)
                                  .checkEmail(
                                      _emailEditingController.text.toString());
                              print(test);
                              // Navigator.of(context).pushNamed('/Signup2');
                            },
                            buttonText: '다음',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
