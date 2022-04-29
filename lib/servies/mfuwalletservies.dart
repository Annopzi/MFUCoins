import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:mfc_coin/servies/mfuwalletfromjson.dart';

class mfuwalletServies with ChangeNotifier {
  String api = "http://selab.mfu.ac.th:7631/api/getAllmfuwallet/";

  late MfuwalletModel home;

  Future<MfuwalletModel?> getmfuwalletData() async {
    final response = await http.get(Uri.parse(api));
    if (response.statusCode == 200) {
      notifyListeners();
      var res = MfuwalletModel.fromJson(jsonDecode(response.body));
      home = res;
      return res;
    } else {
      return null;
    }
  }
}
