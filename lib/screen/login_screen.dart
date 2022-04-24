import 'package:flutter/material.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:mfc_coin/main.dart';
import 'package:mfc_coin/screen/home_screen.dart';
import 'package:mfc_coin/screen/signup_screen.dart';

class Login_screen extends StatefulWidget {
  const Login_screen({Key? key}) : super(key: key);

  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
  //
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController textController2;
  late bool passwordVisibility;
  late TextEditingController usenameController;
  //
  @override
  void initState() {
    super.initState();
    textController2 = TextEditingController();
    passwordVisibility = false;
    usenameController = TextEditingController();
  }
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
              'MFU-Wallet',
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
                child: Image.network(
                  'https://picsum.photos/seed/498/600',
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
                child: TextFormField(
                  onChanged: (_) => EasyDebounce.debounce(
                    'usenameController',
                    const Duration(milliseconds: 200),
                    () => setState(() {}),
                  ),
                  controller: usenameController,
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
                    suffixIcon: usenameController.text.isNotEmpty
                        ? InkWell(
                            onTap: () => setState(
                              () => usenameController.clear(),
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
                    fontSize: 20,
                  ),
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
                    'textController2',
                    const Duration(milliseconds: 2000),
                    () => setState(
                      () {},
                    ),
                  ),
                  controller: textController2,
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
                    fontSize: 20,
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
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF280C55),
                  elevation: 8,
                ),
                onPressed: () async {
                  await Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyHomePage(),
                    ),
                  );
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                ),
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
                    builder: (context) => const signup_screen(),
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
}
