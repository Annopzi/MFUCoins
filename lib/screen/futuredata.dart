import 'package:http/http.dart' as http;
import 'dart:convert';

//getAll
Future<dynamic> getStudentData() async {
  print(456);
  final response = await http
      .get(Uri.parse('http://selab.mfu.ac.th:7631/api/getAllmfuwallet/'));
  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body);
    print(jsonResponse);
    return jsonResponse;
  } else {
    throw Exception('No Internet.');
  }
}



