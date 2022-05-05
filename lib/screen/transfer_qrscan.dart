import 'package:flutter/material.dart';
import 'package:mfc_coin/screen/wldget.dart';

class Trans_screen extends StatelessWidget {
  const Trans_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(77, 42, 134, 1),
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
//======================================================
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image(
              image: NetworkImage(
                "https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX2910335.jpg",
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Align(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ScanQR_Button(),
                  SizedBox(
                    width: 40,
                  ),
                  CrateQR_Button(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ScanQR_Button() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Color.fromRGBO(77, 42, 134, 1),
      ),
      onPressed: () {},
      child: Text(
        "Scan QR",
        style: TextStyle(
          fontSize: 24,
        ),
      ),
    );
  }

  Widget CrateQR_Button() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Color.fromRGBO(77, 42, 134, 1),
      ),
      onPressed: () {},
      child: Text(
        "Crate QR",
        style: TextStyle(
          fontSize: 24,
        ),
      ),
    );
  }
}
