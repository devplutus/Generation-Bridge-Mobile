import 'package:GenerationBridgeMobile/models/GenerationBridgeUser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupProvider with ChangeNotifier {
  GenerationBridgeUser _signupInfo = GenerationBridgeUser();

  Future<dynamic> checkEmail(email) async {
    print(email);
    return "test";
    var result = await FirebaseFirestore.instance
        .collection('UserInfo')
        .doc(email)
        .get();
    return result;
  }
}
