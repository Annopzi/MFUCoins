import 'package:flutter/foundation.dart';
import 'package:mfc_coin/provider/history.dart';

var Trans = "Transfer money";
var Receive = "Receive money";

class HistoryProvider with ChangeNotifier {
  List<history> historys = [];

  List<history> gethistory() {
    return historys;
  }

  void addhistory(history statement) {
    historys.insert(0, statement);

    notifyListeners();
  }
}
