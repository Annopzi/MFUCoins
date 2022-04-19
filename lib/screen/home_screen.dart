import 'package:flutter/material.dart';

class Home_screen extends StatelessWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: Center(
          child: Scaffold(
            body: Center(
              child: Container(
                width: 1000,
                height: 1000,
                // color: Colors.green,
                
              ),
            ),
          ),
        ));
  }
}
