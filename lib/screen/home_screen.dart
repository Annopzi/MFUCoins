import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/rendering.dart';
import 'package:mfc_coin/main.dart';
import 'package:mfc_coin/provider/history.dart';
import 'package:mfc_coin/provider/history_provider.dart';
import 'package:mfc_coin/screen/Student.dart';
import 'package:mfc_coin/screen/transfer_qrscan.dart';
import 'package:mfc_coin/screen/transfer_screen.dart';
import 'package:mfc_coin/screen/wldget.dart';
import 'package:provider/provider.dart';

import 'futuredata.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late Future<dynamic> studentdatas;

  @override
  void initState() {
    super.initState();
    studentdatas = getStudentData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,

      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(77, 42, 134, 1),
        title: const Text(
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
      //===================================================

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            infoacc(context),
            SizedBox(
              height: 20,
            ),
            Align(
              child: Center(
                child: Text("Lasted History"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              color: Colors.black,
            ),
            Align(
              child: Container(
                width: 400,
                height: 270,
                // color: Colors.red,
                child: consumer(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
