import 'package:flutter/material.dart';

class Profile_screen extends StatelessWidget {
  const Profile_screen({Key? key}) : super(key: key);

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
          CircleAvatar(
            child: Image.asset(
              'assets/images/logo_profile_test.png',
            ),
          ),
        ],
      ),
//======================================================
    );
  }
}
