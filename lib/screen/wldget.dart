import 'package:flutter/material.dart';
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
