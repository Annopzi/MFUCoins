import 'package:flutter/material.dart';
import 'package:mfc_coin/screen/home_screen.dart';

class transfer_screen extends StatefulWidget {
  const transfer_screen({Key? key}) : super(key: key);

  @override
  State<transfer_screen> createState() => _transfer_screenState();
}

class _transfer_screenState extends State<transfer_screen> {
  //
  late TextEditingController walletidController;
  late TextEditingController amountController;

  void initState() {
    super.initState();
    walletidController = TextEditingController();
    amountController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var addess = 'MFA9-4SD7-YR5G-B6OA';
    var amount = 600;

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
        padding: const EdgeInsets.all(0.0),
        children: <Widget>[
          // form_top(),
          Container(
            height: 200,
            decoration: const BoxDecoration(
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
                  child: const Text(
                    'FROM',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  width: 278,
                  height: 40,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: Color.fromRGBO(77, 42, 134, 1),
                  ),
                  child: Text(
                    '$addess',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Roboto',
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Text(
                    '$amount MFC',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 3,
          ),

          const ListTile(
            title: Text(
              'To:',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            // color: Color.fromARGB(255, 198, 126, 240),
            padding: const EdgeInsets.all(15),
            child: wallet_id(),
          ),
          const SizedBox(
            height: 5,
            // child: ColoredBox(
            //   color: Color.fromARGB(255, 198, 126, 240),
            // ),
          ),
          Container(
            // color: Color.fromARGB(255, 198, 126, 240),
            padding: const EdgeInsets.all(15),
            child: amount_money(),
          ),
          const SizedBox(
            height: 9,
          ),
          SizedBox(
            height: 200,
            // color: Color.fromARGB(255, 198, 126, 240),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 62, 2, 97),
                  ),
                  onPressed: () {
                    if (walletidController.text.isNotEmpty &&
                        amountController.text.isNotEmpty) {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => Home_screen()),
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text(
                            'Wallet ID & Amount is Empty',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          content: const Text('Please input Wallet & Amount'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Transfer',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromRGBO(77, 42, 134, 1),
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget wallet_id() {
    return TextFormField(
      controller: walletidController,
      decoration: const InputDecoration(
        prefixIcon: Icon(
          Icons.account_balance_wallet_rounded,
          color: Colors.white,
        ),
        hintText: 'Wallet ID',
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        labelStyle: TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        border: OutlineInputBorder(),
        fillColor: Color.fromRGBO(77, 42, 134, 1),
        filled: true,
      ),
      style: const TextStyle(
        fontFamily: 'Poppins',
        color: Color.fromARGB(255, 255, 255, 255),
        fontSize: 20,
      ),
    );
  }

  Widget amount_money() {
    return TextFormField(
      controller: amountController,
      decoration: const InputDecoration(
        prefixIcon: Icon(
          Icons.attach_money_rounded,
          color: Colors.white,
        ),
        hintText: 'Amount',
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        border: OutlineInputBorder(),
        fillColor: Color.fromRGBO(77, 42, 134, 1),
        filled: true,
      ),
      keyboardType: TextInputType.number,
      style: const TextStyle(
        fontFamily: 'Poppins',
        color: Color.fromARGB(255, 255, 255, 255),
        fontSize: 20,
      ),
    );
  }
}
