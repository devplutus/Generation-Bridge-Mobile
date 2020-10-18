import 'dart:async';

import 'package:GenerationBridgeMobile/models/Call.dart';
import 'package:GenerationBridgeMobile/providers/_userInfoProvider.dart';
import 'package:GenerationBridgeMobile/utils/call_methods.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class CallScreen extends StatefulWidget {
  final Call call;

  CallScreen({@required this.call});

  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  static const String APP_ID = '40b5f1c813ef4caebbb1513fa88ec8c3';
  final CallMethods callMethods = CallMethods();

  StreamSubscription callStreamSubscription;
  UserInfoProvider userInfoProvider;

  final _infoStrings = <String>[];
  final _users = <int>[];
  bool muted = false;

  @override
  void initState() {
    super.initState();
    addPostFrameCallback();
    initializeAgora();
  }

  Future<void> initializeAgora() async {
    await _initAgoraEngin();

    _addAgoraEventHandlers();

    await AgoraRtcEngine.enableWebSdkInteroperability(true);

    VideoEncoderConfiguration configuration = VideoEncoderConfiguration();
    configuration.dimensions = Size(1920, 1080);
    await AgoraRtcEngine.setVideoEncoderConfiguration(configuration);
    await AgoraRtcEngine.joinChannel(null, widget.call.channelId, null, 0);
  }

  Future<void> _initAgoraEngin() async {
    await AgoraRtcEngine.create(APP_ID);
    await AgoraRtcEngine.enableVideo();
    await AgoraRtcEngine.setChannelProfile(ChannelProfile.Communication);
    await AgoraRtcEngine.setClientRole(ClientRole.Broadcaster);
  }

  void _addAgoraEventHandlers() {
    AgoraRtcEngine.onError = (dynamic code) {
      setState(() {
        final info = 'onError : $code';
        _infoStrings.add(info);
      });
    };

    AgoraRtcEngine.onJoinChannelSuccess =
        (String channel, int uid, int elapsed) {
      print(
          '$channel, $uid -----------------------------------------------------------------');
      setState(() {
        final info = 'onJoinChannel : $channel, uid: $uid, elapsed $elapsed';
        _infoStrings.add(info);
      });
    };

    AgoraRtcEngine.onLeaveChannel = () {
      setState(() {
        _infoStrings.add('onLeaveChannel');
        _users.clear();
      });
    };

    AgoraRtcEngine.onUserJoined = (int uid, int elapsed) {
      print(uid);
      setState(() {
        final info = 'userJoined : $uid';
        _infoStrings.add(info);
        _users.add(uid);
      });
    };

    AgoraRtcEngine.onUserOffline = (int uid, int reason) {
      callMethods.endCall(call: widget.call);
      setState(() {
        final info = 'userOffline : $uid';
        _infoStrings.add(info);
        _users.remove(uid);
      });
    };

    AgoraRtcEngine.onFirstRemoteVideoFrame =
        (int uid, int width, int height, int elapsed) {
      setState(() {
        final info = 'firstRemoteVideo : $uid, ${width}x $height';
        _infoStrings.add(info);
      });
    };
  }

  addPostFrameCallback() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      userInfoProvider = Provider.of<UserInfoProvider>(context, listen: false);

      callStreamSubscription = callMethods
          .callStream(uid: userInfoProvider.getMyInfo().email)
          .listen((DocumentSnapshot ds) {
        switch (ds.data()) {
          case null:
            Navigator.of(context).pop();
            break;
          default:
            break;
        }
      });
    });
  }

  List<Widget> _viewRows() {
    final views = _getRenderViews();
    switch (views.length) {
      case 1:
        return [
          Container(
            color: Colors.white,
            child: views[0],
          )
        ];
      case 2:
        return [
          Container(
            color: Colors.white,
            child: views[1],
          ),
          Positioned(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height * 0.2,
            right: 20.0,
            top: 20.0,
            child: Container(child: views[0]),
          ),
        ];
    }
  }

  List<Widget> _getRenderViews() {
    final List<AgoraRenderWidget> list = [];
    list.add(AgoraRenderWidget(
      0,
      local: true,
      preview: true,
    ));
    _users.forEach((int uid) => list.add(AgoraRenderWidget(uid)));
    return list;
  }

  Widget _videoView(view) {
    return Expanded(
      child: Container(
        child: view,
        color: Colors.white,
      ),
    );
  }

  Widget _actionButtons() {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.symmetric(
        vertical: 70,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RawMaterialButton(
            onPressed: () => _onToggleMute(),
            padding: EdgeInsets.all(25),
            child: Icon(
              muted == true ? Icons.volume_mute : Icons.volume_up,
              size: 30,
              color: Colors.black,
            ),
            fillColor: Colors.white,
            shape: CircleBorder(),
            elevation: 2.0,
          ),
          RawMaterialButton(
            onPressed: () => callMethods.endCall(call: widget.call),
            padding: EdgeInsets.all(25),
            child: Icon(
              Icons.call_end,
              size: 30,
              color: Colors.white,
            ),
            fillColor: Colors.redAccent[400],
            shape: CircleBorder(),
            elevation: 2.0,
          ),
          RawMaterialButton(
            onPressed: () => _onSwitchCamera(),
            padding: EdgeInsets.all(25),
            child: Icon(
              Icons.rotate_right,
              size: 30,
              color: Colors.black,
            ),
            fillColor: Colors.white,
            shape: CircleBorder(),
            elevation: 2.0,
          ),
        ],
      ),
    );
  }

  void _onToggleMute() {
    setState(() {
      muted = !muted;
    });
    AgoraRtcEngine.muteLocalAudioStream(muted);
  }

  void _onSwitchCamera() {
    AgoraRtcEngine.switchCamera();
  }

  @override
  void dispose() {
    callStreamSubscription.cancel();
    _users.clear();
    AgoraRtcEngine.leaveChannel();
    AgoraRtcEngine.destroy();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            ..._viewRows(),
            // _panel(),
            _actionButtons(),
          ],
        ),
      ),
    );
  }
}
