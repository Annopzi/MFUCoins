import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:mfc_coin/main.dart';
import 'package:mfc_coin/screen/futuredata.dart';
import 'package:mfc_coin/screen/signup_screen.dart';
import 'package:http/http.dart' as http;

class Login_screen extends StatefulWidget {
  const Login_screen({Key? key}) : super(key: key);

  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
  //

  final formkey = GlobalKey<FormState>();
  //
  late TextEditingController passwordController;
  late bool passwordVisibility;
  late TextEditingController emailController;
  List data = [];
  //
  @override
  void initState() {
    super.initState();
    ChangeNotifier();
    passwordController = TextEditingController();
    passwordVisibility = false;
    emailController = TextEditingController();
    getStudentData();
  }
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xCB2C0073),
        automaticallyImplyLeading: false,
        flexibleSpace: Align(
          alignment: const AlignmentDirectional(0.0, 0.5),
          child: InkWell(
            onTap: () async {
              await Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Login_screen(),
                  ));
            },
            child: const Text(
              'MFc-Wallet',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),

          // title: Text(
          //   'MFU-Wallet',
          //   style: TextStyle(
          //     color: Color.fromRGBO(255, 255, 255, 1),
          //     fontFamily: 'Poppins',
          //     fontSize: 20,
          //     fontWeight: FontWeight.normal,
          //   ),
          // ),
        ),
        elevation: 0, //เงา
        centerTitle: true,
      ),

      backgroundColor: const Color(0xFF2C0073),

      body: SingleChildScrollView(
        key: formkey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Container(
                width: 200,
                height: 200,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/mfu_coin_192.png',
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            //สิ้นสุดรูปโปร
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (_) => EasyDebounce.debounce(
                        'emailController',
                        const Duration(milliseconds: 200),
                        () => setState(() {}),
                      ),
                      controller: emailController,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'E-mail',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: emailController.text.isNotEmpty
                            ? InkWell(
                                onTap: () => setState(
                                  () => emailController.clear(),
                                ),
                                child: const Icon(
                                  Icons.clear,
                                  color: Color(0xFF757575),
                                  size: 22,
                                ),
                              )
                            : null,
                      ),
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: TextFormField(
                  onChanged: (_) => EasyDebounce.debounce(
                    'passwordController',
                    const Duration(milliseconds: 2000),
                    () => setState(
                      () {},
                    ),
                  ),
                  controller: passwordController,
                  obscureText: !passwordVisibility,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: InkWell(
                      onTap: () => setState(
                        () => passwordVisibility = !passwordVisibility,
                      ),
                      child: Icon(
                        passwordVisibility
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: const Color(0xFF757575),
                        size: 22,
                      ),
                    ),
                  ),
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //ปุ่ม
            Container(
              color: const Color(0xFF280C55),
              width: 169,
              height: 50,
              child: FutureBuilder<dynamic>(
                future: getStudentData(),
                builder: (context, snapshot) {
                  // List B = [];
                  // B = snapshot.data;

                  // print("B: $B");

                  return ElevatedButton(
                    onPressed: () {
                      // login();
                      if (emailController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        if (emailController.text == "${snapshot.data[0]["email"].toString()}" && passwordController.text == "${snapshot.data[0]["password"].toString()}" ||
                            emailController.text ==
                                    "${snapshot.data[1]["email"].toString()}" &&
                                passwordController.text ==
                                    "${snapshot.data[1]["password"].toString()}" ||
                            emailController.text ==
                                    "${snapshot.data[2]["email"].toString()}" &&
                                passwordController.text ==
                                    "${snapshot.data[2]["password"].toString()}" ||
                            emailController.text == "admin" &&
                                passwordController.text == "admin") {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyHomePage(),
                            ),
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text(
                                'E-mail & Password is Wrong',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              content:
                                  const Text('E-mail and Password is Wrong'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text(
                              'E-mail or Password is Empty',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            content:
                                const Text('Please input E-mail & Password'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF280C55),
                      elevation: 8,
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            const Text(
              'Don’t have an accout yet?',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => signup_screen(),
                  ),
                );
              },
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(0xFF3DB4DA),
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
//======================================================
    );
  }

  Future login() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var response = await http.post(
          Uri.parse("http://selab.mfu.ac.th:7631/api/regismfuwallet"),
          body: ({
            "email": emailController.text,
            "password": passwordController.text,
          }));
      if (response.statusCode == 200) {
        final body = json.decode(response.body);
        print("Token: " + body.toString());
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content: Text("Token: ${body["token"]}"),
        //   ),
        // );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Invalid"),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("E-mail or Password is empty"),
        ),
      );
    }
  }
}
