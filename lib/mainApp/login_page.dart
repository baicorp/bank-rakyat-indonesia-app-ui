import 'package:bri/mainApp/home_page.dart';
import 'package:bri/mainApp/signup.dart';
import 'package:bri/style/font_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'main_menu.dart';
import '../shared_pref.dart';
import '../dummyData/dummy_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  // Shared shr = Shared();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset(
          'assets/icons/brimo-icon.png',
          width: 50.0,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 25.0),
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Selamat Datang',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
            ),
            const SizedBox(height: 130.0),
            Column(
              children: [
                Row(
                  children: const [
                    SizedBox(width: 10.0),
                    Text(
                      'Login',
                      style: appBarButtonBlue,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: username,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.person_outline,
                                color: Color(0xFF014a94),
                              ),
                              hintText: 'Username',
                              border: UnderlineInputBorder()),
                        ),
                        const SizedBox(height: 10.0),
                        TextField(
                          controller: password,
                          obscureText: true,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock_outline,
                                  color: Color(0xFF014a94)),
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.password,
                                  color: Color(0xFF014a94),
                                ),
                              ),
                              hintText: 'Password',
                              border: const UnderlineInputBorder()),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      'Lupa Password?',
                      style: TextStyle(fontSize: 15.0),
                    ),
                    SizedBox(width: 10.0)
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Tidak Punya akun?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: const Text("Buat Akun."),
                ),
              ],
            ),
            const SizedBox(height: 200.0),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 15.0, 0, 15.0),
              child: ElevatedButton(
                style: mainElevatedBtnStyle,
                onPressed: () {
                  /*for (var i = 0; i < DummyData.data.length; i++) {
                    var map = DummyData.data[i];
                    if (map["username"] == username.text &&
                        map["password"] == password.text) {
                      final pref = await SharedPreferences.getInstance();
                      log = true;
                      pref.setBool("log", log);
                      pref.setString("nama", map["nama"]);
                      setState(() {});
                      // username.text = '';
                      password.text = '';
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainPage(
                            username: map['nama'],
                          ),
                        ),
                      );
                      return;
                    }
                  }*/
                  signIn();
                  // username.text = '';
                  // password.text = '';
                  // print('login gagal');
                },
                child: const Text('Login', style: appBarButton),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
            child: ElevatedButton(
              style: mainElevatedBtnStyle,
              onPressed: () {},
              child: const Icon(
                Icons.fingerprint_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: username.text.trim(),
      password: password.text.trim(),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const MainPage(username: "Bagus Atok Illah"),
      ),
    );
  }
}
