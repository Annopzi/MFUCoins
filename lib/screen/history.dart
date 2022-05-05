import 'package:flutter/material.dart';
import 'package:mfc_coin/screen/wldget.dart';

class History_screen extends StatelessWidget {
  const History_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(77, 42, 134, 1),
        title: Text(
          'MFU-Wallet',
          style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontFamily: 'Roboto',
            fontSize: 24,
            fontWeight: FontWeight.normal,
          ),
        ),
        centerTitle: true,
        actions: [
          CircleAvatars("A"),
        ],
      ),
//======================================================
      body: ListView(
        children: <Widget>[
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
              color: Color.fromRGBO(113, 85, 158, 1),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'History',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          //
          Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Align(
                child: Container(
                  width: 400,
                  height: 330,
                  // color: Colors.red,
                  child: consumer(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
