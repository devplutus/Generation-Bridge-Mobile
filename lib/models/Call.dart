class Call {
  String callerId;
  String callerName;
  String callerPic;
  String receiverId;
  String recieverName;
  String receiverPic;
  String channelId;
  bool hasDialled;

  Call(
      {this.callerId,
      this.callerName,
      this.callerPic,
      this.receiverId,
      this.recieverName,
      this.receiverPic,
      this.channelId,
      this.hasDialled});

  Map<String, dynamic> toMap(Call call) {
    Map<String, dynamic> callMap = Map();
    callMap["callerId"] = call.callerId;
    callMap["callerName"] = call.callerName;
    callMap["callerPic"] = call.callerPic;
    callMap["receiverId"] = call.receiverId;
    callMap["recieverName"] = call.recieverName;
    callMap["receiverPic"] = call.receiverPic;
    callMap["channelId"] = call.channelId;
    callMap["hasDialled"] = call.hasDialled;
    return callMap;
  }

  Call.fromMap(Map callMap) {
    this.callerId = callMap["callerId"];
    this.callerName = callMap["callerName"];
    this.callerPic = callMap["callerPic"];
    this.receiverId = callMap["receiverId"];
    this.recieverName = callMap["recieverName"];
    this.receiverPic = callMap["receiverPic"];
    this.channelId = callMap["channelId"];
    this.hasDialled = callMap["hasDialled"];
  }
}
