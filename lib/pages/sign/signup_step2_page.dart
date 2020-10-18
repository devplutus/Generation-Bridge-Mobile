import 'package:GenerationBridgeMobile/utils/lib.dart';
import 'package:GenerationBridgeMobile/widgets/signup_page_button.dart';
import 'package:GenerationBridgeMobile/widgets/signup_page_step.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class SignUpStep2Page extends StatefulWidget {
  @override
  _SignUpStep2PageState createState() => _SignUpStep2PageState();
}

class _SignUpStep2PageState extends State<SignUpStep2Page> {
  int currentPageStep = 1;
  TextEditingController _statusMessageEditingController;
  List<String> hobby = [
    '독서',
    '요리',
    '공연감상',
    '시 감상',
    '등산',
    '수영',
    '테니스',
    '탁구',
    '글쓰기',
    '명상',
    '노래',
    '악기',
    '서예',
    '그림',
    '사진',
    '여행',
    '원예',
    '댄스',
    '수다',
    '산책',
    '만들기',
  ];
  List<String> personality = [
    '자상한',
    '꼼꼼한',
    '상냥한',
    '창의적인',
    '재미있는',
    '열정적인',
    '지적인',
    '포근한',
    '신중한',
    '긍정적인',
    '대범한',
    '사려깊은',
    '활발한',
    '조용한',
    '베푸는',
    '적극적인',
    '섬세한',
    '도전적인',
  ];
  int maxHobby = 3;
  int maxPersonality = 4;
  List<String> selectedHobby = [];
  List<String> selectedPersonality = [];
  bool checkHobby = true;
  bool checkPersonality = true;

  List<String> subTitle1 = ['나의 취미를', '나의 성격을', '나를 소개해주세요.'];

  List<String> subTitle2 = ['3가지 선택해주세요.', '4가지 선택해주세요.', '음성 인식을 사용하시려면'];

  List<Widget> _widgetSubTitle() {
    TextStyle subTitleStyle =
        TextStyle(fontSize: 20, fontWeight: FontWeight.w600);
    return [
      Text(
        subTitle1[currentPageStep - 1],
        style: subTitleStyle,
      ),
      Padding(padding: EdgeInsets.symmetric(vertical: 12.0)),
      Text(
        subTitle2[currentPageStep - 1],
        style: subTitleStyle,
      ),
      currentPageStep == 3
          ? Padding(padding: EdgeInsets.symmetric(vertical: 12.0))
          : Container(),
      currentPageStep == 3
          ? Text(
              '버튼을 클릭 후 말씀해주세요.',
              style: subTitleStyle,
            )
          : Container(),
    ];
  }

  Widget _widgetItemGridView() {
    if (currentPageStep != 3) {
      return Expanded(
        child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 1.6,
          children: currentPageStep == 1
              ? _widgetGetHobbyItems()
              : _widgetGetPersonalityItems(),
        ),
      );
    } else if (currentPageStep == 3) {
      return Container(
        margin: EdgeInsets.only(bottom: 30.0),
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: TextField(
          minLines: 11,
          maxLines: 11,
          controller: _statusMessageEditingController,
          showCursor: true,
          enableInteractiveSelection: true,
          style: TextStyle(height: 1.5),
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 0, color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 0, color: Colors.grey),
            ),
          ),
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1.5),
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
        ),
      );
    }
  }

  List<Widget> _widgetGetHobbyItems() {
    return hobby.map((hobbyName) {
      return Center(
        child: SizedBox(
          child: RaisedButton(
            padding: EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 18.0,
            ),
            onPressed: () {
              setState(() {
                if (selectedHobby.indexOf(hobbyName) != -1) {
                  selectedHobby.remove(hobbyName);
                  checkHobby = true;
                } else {
                  if (selectedHobby.length == maxHobby) {
                    selectedHobby.removeAt(0);
                    selectedHobby.add(hobbyName);
                    checkHobby = false;
                  } else {
                    selectedHobby.add(hobbyName);
                    if (selectedHobby.length == maxHobby) {
                      checkHobby = false;
                    }
                  }
                }
              });
            },
            child: Text(
              hobbyName,
              style: TextStyle(
                fontSize: 15.0,
                color: selectedHobby.contains(hobbyName)
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            color: selectedHobby.contains(hobbyName)
                ? Theme.of(context).primaryColor
                : Colors.white,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(15.0)),
          ),
        ),
      );
    }).toList();
  }

  List<Widget> _widgetGetPersonalityItems() {
    return personality.map((personalityName) {
      return Center(
        child: SizedBox(
          child: RaisedButton(
            padding: EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 18.0,
            ),
            onPressed: () {
              setState(() {
                if (selectedPersonality.indexOf(personalityName) != -1) {
                  selectedPersonality.remove(personalityName);
                  checkPersonality = true;
                } else {
                  if (selectedPersonality.length == maxPersonality) {
                    selectedPersonality.removeAt(0);
                    selectedPersonality.add(personalityName);
                    checkPersonality = false;
                  } else {
                    selectedPersonality.add(personalityName);
                    if (selectedPersonality.length == maxPersonality) {
                      checkPersonality = false;
                    }
                  }
                }
              });
            },
            child: Text(
              personalityName,
              style: TextStyle(
                fontSize: 15.0,
                color: selectedPersonality.contains(personalityName)
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            color: selectedPersonality.contains(personalityName)
                ? Theme.of(context).primaryColor
                : Colors.white,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(15.0)),
          ),
        ),
      );
    }).toList();
  }

  Widget _widgetSpeechButton() {
    return Center(
      child: Column(
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.redAccent,
              child: Icon(
                FontAwesome5Solid.microphone,
                size: 30,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text(
            '음성 받아쓰기',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Padding(padding: EdgeInsets.only(bottom: 50))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Center(
          child: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.white,
              ),
              padding: EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SignUpPageStep(step: currentPageStep),
                  Padding(padding: EdgeInsets.symmetric(vertical: 40.0)),
                  ..._widgetSubTitle(),
                  Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),
                  _widgetItemGridView(),
                  currentPageStep == 3 ? _widgetSpeechButton() : Container(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SignUpPageButton(
                        width: MediaQuery.of(context).size.width * 0.37,
                        buttonText: '이전',
                        onPressed: () {
                          if (currentPageStep == 1) {
                            Navigator.of(context).pop();
                          } else {
                            setState(() {
                              currentPageStep--;
                            });
                          }
                        },
                      ),
                      SignUpPageButton(
                        width: MediaQuery.of(context).size.width * 0.37,
                        disabled: currentPageStep == 3
                            ? null
                            : (currentPageStep == 1
                                ? checkHobby
                                : checkPersonality),
                        backgroundColor: currentPageStep == 3
                            ? HexColor('#349A30')
                            : HexColor('#30459A'),
                        textColor: Colors.white,
                        onPressed: () {
                          setState(() {
                            if (currentPageStep != 3) {
                              currentPageStep++;
                            }
                          });
                        },
                        buttonText: currentPageStep == 3 ? '완료' : '다음',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
