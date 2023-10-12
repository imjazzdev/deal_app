import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:deal_app/pages/home.dart';
import 'package:deal_app/pages/navigation/bottom_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  bool _isvisibily = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(25),
        width: double.maxFinite,
        child: ListView(
          children: [
            SizedBox(
              height: 50,
            ),
            CircleAvatar(
              radius: 80,
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Email',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(1, 1),
                            color: Colors.purple.withOpacity(0.3),
                            blurRadius: 10)
                      ],
                      border: Border.all(color: Colors.purple)),
                  child: TextField(
                    controller: emailC,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Email'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Password',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(1, 1),
                            color: Colors.purple.withOpacity(0.3),
                            blurRadius: 10)
                      ],
                      border: Border.all(color: Colors.purple)),
                  child: TextField(
                    controller: passwordC,
                    obscureText: _isvisibily,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isvisibily = !_isvisibily;
                              });
                            },
                            icon: Icon(
                              _isvisibily
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: Colors.purple,
                            )),
                        border: InputBorder.none,
                        hintText: 'Password'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              child: InkWell(
                onTap: () async {
                  if (emailC.text == 'putri@gmail.com' ||
                      passwordC.text == 'putri123') {
                    Utils.USER_NOW = 'putri@gmail.com';
                    Utils.IS_PENJUAL = true;
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavigation(),
                        ),
                        (route) => false);
                  } else if (emailC.text == 'robert@gmail.com' ||
                      passwordC.text == 'robert123') {
                    Utils.USER_NOW = 'robert@gmail.com';
                    Utils.IS_PENJUAL = false;
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavigation(),
                        ),
                        (route) => false);
                  }

                  // Utils.USER_NOW = 'Putri Ramadhani';
                  // Utils.IS_PENJUAL = true;
                  // Navigator.pushAndRemoveUntil(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => BottomNavigation(),
                  //     ),
                  // (route) => false);

                  // try {
                  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
                  //         email: emailC.text, password: passwordC.text);
                  //     // ignore: use_build_context_synchronously
                  //     Navigator.pushAndRemoveUntil(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => BottomNavigation(),
                  //         ),
                  //         (route) => false);
                  //   } on FirebaseAuthException catch (e) {
                  //     if (e.code == 'wrong-password') {
                  //       setState(() {
                  //         AwesomeDialog(
                  //           context: context,
                  //           animType: AnimType.scale,
                  //           dialogType: DialogType.warning,
                  //           title:
                  //               'Email & password incorrect. Please try again',
                  //           btnOkOnPress: () {},
                  //         ).show();

                  //         emailC.clear();
                  //         passwordC.clear();
                  //       });
                  //     } else if (e.code == 'user-not-found') {
                  //       setState(() {
                  //         AwesomeDialog(
                  //           context: context,
                  //           animType: AnimType.scale,
                  //           dialogType: DialogType.error,
                  //           title: 'User not found. Try again',
                  //           btnOkOnPress: () {},
                  //         ).show();

                  //         emailC.clear();
                  //         passwordC.clear();
                  //       });
                  //     }
                  //     // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //     //   content: Text(e.toString()),
                  //     //   backgroundColor: Colors.orange.shade400,
                  //     // ));
                  //   }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 150,
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.purple.shade400),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
