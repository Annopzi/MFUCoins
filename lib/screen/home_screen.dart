import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/rendering.dart';
import 'package:mfc_coin/main.dart';
import 'package:mfc_coin/provider/history.dart';
import 'package:mfc_coin/provider/history_provider.dart';
import 'package:mfc_coin/screen/Student.dart';
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
  String money = '500';
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late Future<dynamic> studentdatas;

  @override
  void initState() {
    super.initState();
    studentdatas = getStudentData();
  }

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    double amounttr = 100;

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
          CircleAvatar(
            child: Image.asset(
              'assets/images/logo_profile_test.png',
            ),
          ),
        ],
      ),
      //===================================================

      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Container(
              child: nav(),
            ),
          ),
          //
          Column(
            children: <Widget>[
              SizedBox(
                height: 230,
              ),
              Align(
                child: Center(
                  child: Text(
                    'Lasted History',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.black,
              ),
              // SingleChildScrollView

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
        ],
      ),
    );
  }
}

class nav extends StatelessWidget {
  const nav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double amount = 600;
    return Center(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(0),
          child: SizedBox(
            width: 1000,
            height: 200,
            child: Container(
              width: 1000,
              height: 1000,
              // color: Colors.green,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                  bottomLeft: const Radius.circular(18),
                  bottomRight: Radius.circular(18),
                ),
                color: Color.fromRGBO(113, 85, 158, 1),
              ),

              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: FutureBuilder<dynamic>(
                        future: getStudentData(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                              children: [
                                amount_by_acc(
                                    "${snapshot.data[0]['amount'].toString()} MFC"),
                                //${data[0]['id']}
                              ],
                            );
                          } else if (snapshot.hasError) {
                            return Column(
                              children: [
                                amount_by_acc(
                                  "ID: [ No Have Data ]",
                                ),
                              ],
                            );
                          }
                          return CircularProgressIndicator();
                        },
                      )),
                  const SizedBox(
                    height: 20,
                    width: 2,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => transfer_screen()),
                            ),
                          );
                        },
                        child: const Align(
                          child: CircleAvatar(
                            radius: 35,
                            backgroundColor: Color.fromRGBO(77, 42, 134, 1),
                            child: Icon(
                              Icons.currency_exchange,
                              size: 50,
                              color: Color.fromARGB(255, 233, 233, 233),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () async {},
                        child: const Align(
                          child: CircleAvatar(
                            radius: 35,
                            backgroundColor: Color.fromRGBO(77, 42, 134, 1),
                            // color : Color.fromRGBO(77, 42, 134, 1),
                            child: Icon(
                              Icons.qr_code_2,
                              size: 50,
                              color: Color.fromARGB(255, 233, 233, 233),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StudentName_screen(),
                            ),
                          );
                        },
                        child: const Align(
                          child: CircleAvatar(
                            radius: 35,
                            backgroundColor: Color.fromRGBO(77, 42, 134, 1),
                            child: Icon(
                              Icons.settings,
                              size: 50,
                              color: Color.fromARGB(255, 233, 233, 233),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                ],
              ),
            ),
          ),
        ),
        // backgroundColor: Colors.red,
      ),
    );
  }
}
