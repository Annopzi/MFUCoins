import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/rendering.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  // ignore: prefer_typing_uninitialized_variables

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int a = 6;
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
                  height: 275,
                  // color: Colors.red,
                  child: ListView.builder(
                    itemCount: 17,
                    itemBuilder: (context, index) {
                      var information = index + 1;
                      return Card(
                        elevation: 5,
                        child: ListTile(
                          title: Text('Transfer money $information'),
                          subtitle: Text('Payment'),
                          //
                          // trailing: ,
                        ),
                      );
                    },
                  ),
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
    return Center(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(0),
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
                  const Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Text(
                      '500 MFC',
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                    width: 2,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Align(
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
                      SizedBox(
                        width: 20,
                      ),
                      Align(
                        child: CircleAvatar(
                          radius: 35,
                          backgroundColor: Color.fromRGBO(77, 42, 134, 1),
                          // color : Color.fromRGBO(77, 42, 134, 1),
                          child: Icon(
                            Icons.download,
                            size: 50,
                            color: Color.fromARGB(255, 233, 233, 233),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Align(
                        child: CircleAvatar(
                          radius: 35,
                          backgroundColor: Color.fromRGBO(77, 42, 134, 1),
                          child: Icon(
                            Icons.account_balance,
                            size: 50,
                            color: Color.fromARGB(255, 233, 233, 233),
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

class his extends StatelessWidget {
  const his({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, int index) {
          return Card(
            elevation: 5,
            child: ListTile(
              title: Text('Menu'),
            ),
          );
        },
      ),
    );
  }
}
