import 'package:bri/form.dart';
import 'package:bri/mainApp/login_page.dart';
import 'package:bri/mainApp/main_menu.dart';
import 'package:bri/shared_pref.dart';
import 'package:bri/style/font_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AkunMenu extends StatelessWidget {
  const AkunMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Akun', style: appBarButton),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const FormLoginValidate(),
          Center(
            child: ElevatedButton(
              onPressed: () {
                /*final pref = await SharedPreferences.getInstance();
              log = false;
              pref.setBool("log", log);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );*/
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              child: const Text('Log Out', style: appBarButton),
            ),
          ),
        ],
      ),
    );
  }
}
