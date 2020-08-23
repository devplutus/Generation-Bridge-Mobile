import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';

class CallPage extends StatefulWidget {
  final appID = '40b5f1c813ef4caebbb1513fa88ec8c3';
  final channelName;

  CallPage({Key key, this.channelName}) : super(key: key);

  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  final _infoStrings = <String>[];
  final _users = <int>[];

  @override
  void dispose() {
    AgoraRtcEngine.leaveChannel();
    AgoraRtcEngine.destroy();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    await _initAgoraEngin();

    await AgoraRtcEngine.enableWebSdkInteroperability(true);

    _addAgoraEventHandlers();

    VideoEncoderConfiguration configuration = VideoEncoderConfiguration();
    configuration.dimensions = Size(1920, 1080);
    await AgoraRtcEngine.setVideoEncoderConfiguration(configuration);
    await AgoraRtcEngine.joinChannel(null, widget.channelName, null, 0);
  }

  Future<void> _initAgoraEngin() async {
    print('${widget.appID} ${widget.channelName}');
    await AgoraRtcEngine.create(widget.appID);
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

  Widget _expandedVideoRow(List<Widget> views) {
    final wrappedViews = views.map<Widget>(_videoView).toList();
    return wrappedViews[0];
  }

  Widget _panel() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48),
      alignment: Alignment.bottomCenter,
      child: FractionallySizedBox(
        heightFactor: 0.5,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 48),
          child: ListView.builder(
            reverse: true,
            itemCount: _infoStrings.length,
            itemBuilder: (BuildContext context, int index) {
              if (_infoStrings.isEmpty) {
                return null;
              }
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 3,
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.yellowAccent,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          _infoStrings[index],
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: () => _onExitCall(),
            padding: EdgeInsets.all(20),
            child: Icon(
              Icons.call_end,
              size: 30,
              color: Colors.white,
            ),
            fillColor: Colors.redAccent[400],
            shape: CircleBorder(),
            elevation: 2.0,
          ),
        ],
      ),
    );
  }

  void _onExitCall() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final views = _getRenderViews();

    return SafeArea(
      child: Center(
        child: Stack(
          children: [
            Container(
              color: Colors.white,
              child: views.length == 1 ? null : views[1],
            ),
            Positioned(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.2,
              right: 20.0,
              top: 20.0,
              child: Container(child: views[0]),
            ),
            // _panel(),
            _actionButtons(),
          ],
        ),
      ),
    );
  }
}
