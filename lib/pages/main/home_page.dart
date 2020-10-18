import 'package:GenerationBridgeMobile/models/GenerationBridgeUser.dart';
import 'package:GenerationBridgeMobile/providers/_userInfoProvider.dart';
import 'package:GenerationBridgeMobile/utils/call_utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GenerationBridgeUser _myInfo;
  TextStyle getSubTitleStyle() {
    return TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    );
  }

  Widget _widgetMyProfile() {
    return Container(
      height: 70.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[300],
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: double.infinity,
            width: 55.0,
            margin: EdgeInsets.only(bottom: 14.0),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 40.0,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(right: 10.0)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${_myInfo.nickName} ${_myInfo.name}',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _widgetProfileCard(GenerationBridgeUser friends) {
    return Container(
      height: 210.0,
      width: double.infinity,
      margin: EdgeInsets.only(
        bottom: 40,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Colors.grey[400]),
          boxShadow: [
            BoxShadow(color: Colors.grey[400], spreadRadius: 1, blurRadius: 7)
          ]),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: double.infinity,
              width: MediaQuery.of(context).size.width * 0.04,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                ),
              ),
            ),
            Container(
              height: double.infinity,
              width: MediaQuery.of(context).size.width * 0.50,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.0),
                    height: 140.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        friends.profileImageURL == null
                            ? Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Icon(
                                  Icons.person,
                                  size: 50.0,
                                  color: Colors.white,
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.network(
                                  friends.profileImageURL,
                                  fit: BoxFit.cover,
                                  width: 100.0,
                                  height: 100.0,
                                ),
                              ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.only(bottom: 15.0)),
                            Text(
                              friends.name,
                              style: TextStyle(fontSize: 30.0),
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 4.0)),
                            Text(
                              '${friends.age}세',
                              style: TextStyle(fontSize: 26.0),
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 4.0)),
                            Text(
                              '${friends.city}',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 65.0,
                    alignment: Alignment.centerLeft,
                    padding:
                        EdgeInsets.only(right: 10.0, left: 10.0, bottom: 10.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(
                        '${friends.profileMessage}',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FractionallySizedBox(
                    widthFactor: 0.9,
                    child: Container(
                      height: 70.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey[300]),
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[300],
                              blurRadius: 3,
                              spreadRadius: 1,
                            )
                          ]),
                      child: FlatButton.icon(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        icon: Icon(
                          FontAwesome5Solid.phone_volume,
                          color: Theme.of(context).primaryColor,
                          size: 25.0,
                        ),
                        label: Text(
                          '통화',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: 0.9,
                    child: Container(
                      height: 70.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey[300]),
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[300],
                              blurRadius: 3,
                              spreadRadius: 1,
                            )
                          ]),
                      child: FlatButton.icon(
                        onPressed: () => CallUtils.dial(
                            from: _myInfo, to: friends, context: context),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        icon: Icon(
                          FontAwesome5Solid.video,
                          color: Theme.of(context).primaryColor,
                          size: 25.0,
                        ),
                        label: Text(
                          ' 화상\n\r통화',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _myInfo = Provider.of<UserInfoProvider>(context).getMyInfo();
    List<GenerationBridgeUser> friendsList = _myInfo.friends;
    return Expanded(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        dragStartBehavior: DragStartBehavior.down,
        children: [
          Padding(padding: EdgeInsets.only(top: 20.0)),
          _widgetMyProfile(),
          Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),
          Row(
            children: [
              Icon(
                MaterialCommunityIcons.account_heart,
                size: 35.0,
                color: Theme.of(context).primaryColor,
              ),
              Padding(padding: EdgeInsets.only(right: 10.0)),
              Text('내 짝꿍', style: getSubTitleStyle()),
            ],
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 15)),
          ...friendsList.map<Widget>((v) {
            return Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 150.0),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '3회 / 2시간 30분',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                  _widgetProfileCard(v)
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
