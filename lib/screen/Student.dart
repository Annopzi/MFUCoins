import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StudentName_screen extends StatefulWidget {
  const StudentName_screen({Key? key}) : super(key: key);

  @override
  State<StudentName_screen> createState() => _StudentName_screenState();
}

class _StudentName_screenState extends State<StudentName_screen> {
  late Future<dynamic> studentdata;

  @override
  void initState() {
    super.initState();
    studentdata = StudentData();
    // StudentData();
  }

  Future<dynamic> StudentData() async {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter UI Code'),
        elevation: 4,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Align(
              child: Text(
                'StudentName',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Align(
              child: FutureBuilder<dynamic>(
                future: studentdata,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        _buildRow("ID:  ${snapshot.data[1]['id'].toString()} "),
                        //${data[0]['id']}
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Column(
                      children: [
                        _buildRow(
                          "ID: [ No Have Data ]",
                        ),
                      ],
                    );
                  }
                  return CircularProgressIndicator();
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Align(
              child: FutureBuilder<dynamic>(
                future: studentdata,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        _buildRow(
                            "Username:   ${snapshot.data[1]['username'].toString()}  "),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Column(
                      children: [
                        _buildRow(
                          "Name: [ No Have Data ]",
                        ),
                      ],
                    );
                  }
                  return CircularProgressIndicator();
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Align(
              child: FutureBuilder<dynamic>(
                future: studentdata,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        _buildRow(
                            "E-mail:   ${snapshot.data[1]['email'].toString()}  "),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Column(
                      children: [
                        _buildRow(
                          "Email: [ No Have Data ]",
                        ),
                      ],
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildRow(String dataRow) {
  return ListTile(
    tileColor: Color.fromARGB(255, 139, 240, 192),
    contentPadding: EdgeInsets.all(34.0),
    style: ListTileStyle.drawer,
    title: Text(
      dataRow,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
