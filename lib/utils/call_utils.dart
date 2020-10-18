import 'dart:math';

import 'package:GenerationBridgeMobile/main.dart';
import 'package:GenerationBridgeMobile/models/Call.dart';
import 'package:GenerationBridgeMobile/models/GenerationBridgeUser.dart';
import 'package:flutter/material.dart';

import 'call_methods.dart';

class CallUtils {
  static final CallMethods callMethods = CallMethods();

  static dial(
      {GenerationBridgeUser from, GenerationBridgeUser to, context}) async {
    Call call = Call(
      callerId: from.email,
      callerName: from.name,
      callerPic: from.profileImageURL,
      receiverId: to.email,
      recieverName: to.name,
      receiverPic: to.profileImageURL,
      channelId: Random().nextInt(1000).toString(),
    );

    bool callMade = await callMethods.makeCall(call: call);

    call.hasDialled = true;

    if (callMade) {
      Navigator.of(context).pushNamed('/Call/Start', arguments: call);
    }
  }
}
