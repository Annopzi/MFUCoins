import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Test_screen extends StatefulWidget {
  const Test_screen({Key? key}) : super(key: key);

  @override
  State<Test_screen> createState() => _Test_screenState();
}

class _Test_screenState extends State<Test_screen> {
  //
  late Future<dynamic> futureAlbum;

  //
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 173, 0, 226),
        title: const Text('TEST API'),
        elevation: 4,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Align(
              child: Text(
                'test',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              alignment: Alignment.center,
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              child: Container(
                padding: const EdgeInsets.all(17.0),
                margin: const EdgeInsets.all(20.0),
                width: 1000,
                height: 450,
                // color: Colors.red,
                //

                child: FutureBuilder<dynamic>(
                  future: futureAlbum,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        //สร้าง Widget ListView

                        children: [
                          _buildRow(snapshot.data["results"].toString()),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    // รูป Spiner ขณะรอโหลดข้อมูล
                    return CircularProgressIndicator();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<dynamic> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('http://selab.mfu.ac.th:7631/api/get/email/mfuwallet/'));

  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body);

    // var itemCount = jsonResponse;
    return jsonResponse;
  } else {
    throw Exception('Failed to load');
  }
}

Widget _buildRow(String dataRow) {
  return ListTile(
    title: Text(
      dataRow,
    ),
  );
}
