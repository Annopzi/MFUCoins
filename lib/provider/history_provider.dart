import 'package:flutter/foundation.dart';
import 'package:mfc_coin/provider/history.dart';

var Trans = "Transfer money";
var Receive = "Receive money";

class HistoryProvider with ChangeNotifier {
  List<history> historys = [
    history(title: "${Receive.toString()}", amount: 800, date: DateTime.now()),
    history(title: "${Trans.toString()}", amount: 100, date: DateTime.now()),
    history(title: "${Receive.toString()}", amount: 20, date: DateTime.now()),
    history(title: "${Receive.toString()}", amount: 80, date: DateTime.now()),
    history(title: "${Trans.toString()}", amount: 1000, date: DateTime.now()),
  ];

  List<history> gethistory() {
    return historys;
  }

  void addhistory(history statement) {
    historys.add(statement);
  }
}
