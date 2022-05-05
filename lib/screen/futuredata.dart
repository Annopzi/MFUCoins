import 'package:http/http.dart' as http;
import 'dart:convert';

//getAll
Future<dynamic> getStudentData() async {
  List datas = [];
  print('Data Ready');
  final response = await http
      .get(Uri.parse('http://selab.mfu.ac.th:7631/api/getAllmfuwallet/'));
  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body);
    datas = jsonResponse;
    print("Data: ${datas}\n Data.length: ${datas.length}");
    return datas;
  } else {
    throw Exception('No Internet.');
  }
}
