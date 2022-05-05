import 'package:flutter/material.dart';
import 'package:mfc_coin/main.dart';
import 'package:mfc_coin/screen/Student.dart';
import 'package:mfc_coin/screen/futuredata.dart';
import 'package:mfc_coin/screen/home_screen.dart';
import 'package:mfc_coin/screen/transfer_qrscan.dart';
import 'package:mfc_coin/screen/transfer_screen.dart';
import 'package:provider/provider.dart';

import '../provider/history.dart';
import '../provider/history_provider.dart';

Widget title(String str) {
  return Text(
    str,
    style: TextStyle(
      fontSize: 16,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
  );
}

Widget subtitle(String str) {
  return Text(
    str,
    style: TextStyle(
      fontSize: 13,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
  );
}

Widget amount(String str) {
  return Text(
    str,
    style: TextStyle(
      fontSize: 18,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
  );
}

Widget amount_by_acc(String str) {
  return Text(
    str,
    style: TextStyle(
      fontSize: 28,
      color: Colors.white,
    ),
  );
}

Widget CircleAvatars(String str) {
  return CircleAvatar(
    radius: 20,
    child: Text(str),
  );
}

Widget Loading(String str) {
  return Center(
    child: Text(
      str,
      style: TextStyle(
        fontSize: 30,
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      textAlign: TextAlign.center,
    ),
  );
}

Widget dialog(BuildContext context, String title, String content) {
  return AlertDialog(
    title: Text(
      title,
      style: TextStyle(
        fontSize: 16,
      ),
    ),
    content: Text(content),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context, 'OK'),
        child: const Text('OK'),
      ),
    ],
  );
}

Widget Trans_finish(BuildContext context, String title, String content) {
  return AlertDialog(
    title: Text(
      title,
      style: TextStyle(
        fontSize: 16,
      ),
    ),
    content: Text(content),
    actions: [
      TextButton(
        onPressed: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => MyHomePage()),
          ),
        ),
        child: const Text('OK'),
      ),
    ],
  );
}

Widget consumer() {
  return Consumer(
    builder: ((context, HistoryProvider provider, child) {
      return ListView.builder(
        itemCount: provider.historys.length,
        itemBuilder: (context, index) {
          history data = provider.historys[index];
          return Card(
            elevation: 5,
            child: ListTile(
              title: title(data.title),
              subtitle: subtitle(data.date.toString()),
              //
              // trailing: ,
              trailing: Title(
                color: Colors.black,
                child: amount(data.amount.toString()),
              ),
            ),
          );
        },
      );
    }),
  );
}

Widget infoacc(BuildContext context) {
  return Align(
    child: Container(
      width: 1000,
      height: 200,
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
                onTap: () async {
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Trans_screen()));
                },
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
                      Icons.account_circle_rounded,
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
  );
}
