import 'package:flutter/material.dart';
import 'package:mfc_coin/provider/history.dart';
import 'package:mfc_coin/provider/history_provider.dart';
import 'package:mfc_coin/screen/futuredata.dart';
import 'package:mfc_coin/screen/home_screen.dart';
import 'package:mfc_coin/screen/wldget.dart';
import 'package:provider/provider.dart';

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
    getStudentData();
  }

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
          CircleAvatar(child: CircleAvatars("A")),
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
            child: FutureBuilder<dynamic>(
              future: getStudentData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
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
                        height: 45,
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
                          "My ID: ${snapshot.data[0]["id"]}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Roboto',
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Text(
                          "${snapshot.data[0]["amount"]} MFC",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
              // child:
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
                      if (double.parse(amountController.text) <= 0 ||
                          double.parse(walletidController.text) <= 0) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => dialog(
                              context,
                              "Wallet ID & Amount is must more than 0",
                              "Please input Wallet & Amount"),
                        );
                      } else {
                        var title = "Transfer money";
                        var Id = walletidController.text;
                        var Amount = amountController.text;
                        print(Id);
                        print(Amount);
                        history statement = history(
                          title: "${title} To ${Id}",
                          amount: double.parse(Amount),
                          date: DateTime.now(),
                        );
                        var provider = Provider.of<HistoryProvider>(context,
                            listen: false);
                        provider.addhistory(statement);

                        Navigator.pop(context);
                        // showDialog(
                        //   context: context,
                        //   builder: (BuildContext context) =>
                        //       Trans_finish(context, "Success", "Finish"),
                        // );
                      }
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => dialog(
                            context,
                            "Wallet ID & Amount is Empty",
                            "Please input Wallet & Amount"),
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
      keyboardType: TextInputType.number,
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
