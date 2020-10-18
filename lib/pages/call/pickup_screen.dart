import 'package:GenerationBridgeMobile/models/Call.dart';
import 'package:GenerationBridgeMobile/utils/call_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PickupScreen extends StatelessWidget {
  final Call call;
  final CallMethods callMethods = CallMethods();

  PickupScreen({
    @required this.call,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "짝꿍의 전화가 왔습니다",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            call.callerPic != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.network(
                      call.callerPic,
                      height: 150,
                      width: 150,
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Container(
                      width: 150,
                      height: 150,
                      color: Colors.grey,
                      child: Center(
                        child: Icon(
                          Icons.person,
                          size: 70.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
            SizedBox(
              height: 30,
            ),
            Text(
              call.callerName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            SizedBox(
              height: 150,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80.0,
                  width: 80.0,
                  child: FloatingActionButton(
                    onPressed: () => Navigator.pushNamed(context, '/Call/Start',
                        arguments: call),
                    backgroundColor: Colors.green,
                    child: Icon(Icons.call),
                  ),
                ),
                SizedBox(
                  width: 70,
                ),
                SizedBox(
                  height: 80.0,
                  width: 80.0,
                  child: FloatingActionButton(
                    onPressed: () async {
                      await callMethods.endCall(call: call);
                    },
                    backgroundColor: Colors.redAccent,
                    child: Icon(Icons.call_end),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
