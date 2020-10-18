import 'dart:async';

import 'package:GenerationBridgeMobile/models/Call.dart';
import 'package:GenerationBridgeMobile/models/GenerationBridgeUser.dart';
import 'package:GenerationBridgeMobile/pages/call/call_screen.dart';
import 'package:GenerationBridgeMobile/pages/call/pickup_screen.dart';
import 'package:GenerationBridgeMobile/providers/_userInfoProvider.dart';
import 'package:GenerationBridgeMobile/utils/call_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CallPageStreamLayout extends StatelessWidget {
  final Widget scaffold;
  final CallMethods callMethods = CallMethods();

  CallPageStreamLayout({@required this.scaffold});

  @override
  Widget build(BuildContext context) {
    final myInfoProvider = Provider.of<UserInfoProvider>(context);

    return (myInfoProvider != null && myInfoProvider.getMyInfo() != null)
        ? StreamBuilder<DocumentSnapshot>(
            stream: callMethods.callStream(
              uid: myInfoProvider.getMyInfo().email,
            ),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data.exists) {
                Call call = Call.fromMap(snapshot.data.data());
                if (!call.hasDialled) {
                  return PickupScreen(call: call);
                } else {
                  return scaffold;
                }
              }
              return scaffold;
            },
          )
        : Scaffold(
            body: CircularProgressIndicator(),
          );
  }
}
