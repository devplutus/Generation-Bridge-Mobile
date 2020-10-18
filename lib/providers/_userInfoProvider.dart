import 'package:GenerationBridgeMobile/models/GenerationBridgeUser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserInfoProvider with ChangeNotifier {
  GenerationBridgeUser _myInfo;
  GenerationBridgeUser getMyInfo() => _myInfo;

  Future<bool> loginWithEmailAndPassword(String email, String password) async {
    try {
      var _userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (_userCredential != null) {
        var docInfo = await _getUserInfo(_userCredential.user.email);
        var friendsEmail = docInfo['friends'] as List<dynamic>;
        _myInfo = GenerationBridgeUser(generationBridgeUser: docInfo);
        if (friendsEmail != null) {
          for (int i = 0; i < friendsEmail.length; i++) {
            var friendInfo = await _getUserInfo(friendsEmail[i].toString());
            _myInfo.addFriend(
                GenerationBridgeUser(generationBridgeUser: friendInfo));
          }
        }
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<Map<String, dynamic>> _getUserInfo(String email) async {
    var docInfo = await FirebaseFirestore.instance
        .collection('UserInfo')
        .doc(email)
        .get();
    var mapInfo = docInfo.data();
    mapInfo["email"] = docInfo.id;
    return mapInfo;
  }
}
