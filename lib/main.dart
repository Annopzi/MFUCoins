import 'package:flutter/material.dart';
import 'package:mfc_coin/provider/history_provider.dart';
import 'package:mfc_coin/screen/Student.dart';
import 'package:mfc_coin/screen/history.dart';
import 'package:mfc_coin/screen/home_screen.dart';
import 'package:mfc_coin/screen/login_screen.dart';
import 'package:mfc_coin/screen/transfer_qrscan.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return HistoryProvider();
        })
      ],
      child: MaterialApp(
        title: 'MFc coin',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Login_screen(), //Login_screen()
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Color.fromRGBO(77, 42, 134, 1),
          body: TabBarView(children: [
            Home_screen(),
            Trans_screen(),
            History_screen(),
            StudentName_screen(),
          ]),
          bottomNavigationBar: TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.home,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.qr_code_scanner,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.history,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.account_circle,
                ),
              ),
            ],
          ),
        ));
  }
}
