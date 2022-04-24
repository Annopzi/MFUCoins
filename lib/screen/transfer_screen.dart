import 'package:flutter/material.dart';

class transfer_screen extends StatelessWidget {
  const transfer_screen({Key? key}) : super(key: key);

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
      //

      body: ListView(
        //   SizedBox.expand(
        //     child: Container(
        //       child: form_top(),
        //     ),
        //   ),

        // mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        padding: const EdgeInsets.all(0.0),
        children: <Widget>[
          // form_top(),
          Container(
            height: 200,
            // color: Colors.red,
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
                Container(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Text(
                    'FROM',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 278,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: Color.fromRGBO(77, 42, 134, 1),
                  ),
                  child: Text(
                    'MFA9-4SD7-YR5G-B6OA',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Roboto',
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Text(
                    '600.0 MFC',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2,
          ),
          ListTile(
            title: Text('To:'),
          ),
          wallet_id(),
          SizedBox(
            height: 10,
          ),
          amount_money(),
        ],
      ),
    );
  }

  Widget wallet_id() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Wallet ID',
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        border: OutlineInputBorder(),
        fillColor: Color.fromRGBO(77, 42, 134, 1),
        filled: true,
      ),
      style: TextStyle(
        fontFamily: 'Poppins',
        color: Color.fromARGB(255, 255, 255, 255),
        fontSize: 20,
      ),
    );
  }

  Widget amount_money() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Amount',
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        border: OutlineInputBorder(),
        fillColor: Color.fromRGBO(77, 42, 134, 1),
        filled: true,
      ),
      keyboardType: TextInputType.number,
      style: TextStyle(
        fontFamily: 'Poppins',
        color: Color.fromARGB(255, 255, 255, 255),
        fontSize: 20,
      ),
    );
  }
}
