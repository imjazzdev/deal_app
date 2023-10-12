import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:deal_app/pages/produk_saya.dart';
import 'package:deal_app/pages/signin.dart';
import 'package:deal_app/utils/utils.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.purple.shade50,
                    child: Icon(
                      Icons.person_2_rounded,
                      size: 180,
                      color: Colors.purple,
                    ),
                    radius: 100,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    Utils.USER_NOW,
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    Utils.IS_PENJUAL ? 'Penjual' : 'User',
                    style: TextStyle(fontSize: 20, color: Colors.grey.shade700),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Utils.IS_PENJUAL
                      ? ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProdukSaya(),
                                ));
                          },
                          child: Text('Lihat produk'),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple[400]),
                        )
                      : const SizedBox(),
                ],
              ),
              Positioned(
                top: 0,
                right: 30,
                child: IconButton(
                    onPressed: () {
                      AwesomeDialog(
                        context: context,
                        animType: AnimType.scale,
                        dialogType: DialogType.warning,
                        title: 'Ingin logout?',
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignIn(),
                              ),
                              (route) => false);
                        },
                      ).show();
                    },
                    icon: Icon(
                      Icons.logout_rounded,
                      size: 50,
                      color: Colors.red,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
