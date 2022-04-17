import 'package:flutter/material.dart';
import 'package:easy_debounce/easy_debounce.dart';

class signup_screen extends StatefulWidget {
  const signup_screen({Key? key}) : super(key: key);

  @override
  State<signup_screen> createState() => _signup_screenState();
}

class _signup_screenState extends State<signup_screen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController userController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmpasswordController;
  late bool passwordVisibility;
  late bool confirmpasswordVisibility;
  //
  @override
  void initState() {
    super.initState();
    passwordVisibility = false;
    confirmpasswordVisibility = false;
    emailController = TextEditingController();
    userController = TextEditingController();
    passwordController = TextEditingController();
    confirmpasswordController = TextEditingController();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        automaticallyImplyLeading: false,
        flexibleSpace: const Align(
          alignment: AlignmentDirectional(0.0, 0.5),

          child: Text(
            'MFU-Wallet',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 83, 51, 51),
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.normal,
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
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
            const SizedBox(
              height: 20,
            ),
            //username
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: TextFormField(
                  onChanged: (_) => EasyDebounce.debounce(
                    'userController',
                    const Duration(milliseconds: 200),
                    () => setState(() {}),
                  ),
                  controller: userController,
                  obscureText: false,
                  // cursorColor: Color.fromARGB(255, 0, 0, 0),
                  decoration: InputDecoration(
                    hintText: 'Username',
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    focusColor: const Color.fromARGB(255, 255, 255, 255),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: const Color.fromRGBO(113, 85, 158, 1),
                    //ปุ่มกากบาท
                    suffixIcon: userController.text.isNotEmpty
                        ? InkWell(
                            onTap: () => setState(
                              () => userController.clear(),
                            ),
                            child: const Icon(
                              Icons.clear,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              size: 22,
                            ),
                          )
                        : null,
                  ),
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 19,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //email
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: TextFormField(
                  onChanged: (_) => EasyDebounce.debounce(
                    'emailController',
                    const Duration(milliseconds: 200),
                    () => setState(() {}),
                  ),
                  controller: emailController,
                  obscureText: false,
                  // cursorColor: Color.fromARGB(255, 0, 0, 0),
                  decoration: InputDecoration(
                    hintText: 'E-mail',
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    focusColor: const Color.fromARGB(255, 255, 255, 255),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: const Color.fromRGBO(113, 85, 158, 1),
                    //ปุ่มกากบาท
                    suffixIcon: emailController.text.isNotEmpty
                        ? InkWell(
                            onTap: () => setState(
                              () => emailController.clear(),
                            ),
                            child: const Icon(
                              Icons.clear,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              size: 22,
                            ),
                          )
                        : null,
                  ),
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 19,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //password
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: TextFormField(
                  onChanged: (_) => EasyDebounce.debounce(
                    'passwordController',
                    const Duration(milliseconds: 200),
                    () => setState(() {}),
                  ),
                  controller: passwordController,
                  obscureText: !passwordVisibility,

                  // cursorColor: Color.fromARGB(255, 0, 0, 0),
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    focusColor: const Color.fromARGB(255, 255, 255, 255),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: const Color.fromRGBO(113, 85, 158, 1),

                    //ปุ่มดูรหัส
                    suffixIcon: InkWell(
                      onTap: () => setState(
                        () => passwordVisibility = !passwordVisibility,
                      ),
                      child: Icon(
                        passwordVisibility
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Color.fromARGB(255, 255, 255, 255),
                        size: 22,
                      ),
                    ),
                  ),
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 19,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //คอนเฟิร์มพาส
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: TextFormField(
                  onChanged: (_) => EasyDebounce.debounce(
                    'confirmpasswordController',
                    const Duration(milliseconds: 200),
                    () => setState(() {}),
                  ),
                  controller: confirmpasswordController,
                  obscureText: !confirmpasswordVisibility,

                  // cursorColor: Color.fromARGB(255, 0, 0, 0),
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    focusColor: const Color.fromARGB(255, 255, 255, 255),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: const Color.fromRGBO(113, 85, 158, 1),

                    //ปุ่มดูรหัส
                    suffixIcon: InkWell(
                      onTap: () => setState(
                        () => confirmpasswordVisibility =
                            !confirmpasswordVisibility,
                      ),
                      child: Icon(
                        confirmpasswordVisibility
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        size: 22,
                      ),
                    ),
                  ),
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 19,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //ปุ่มสมัคร
            //
          ],
        ),
      ),
    );
  }
}
