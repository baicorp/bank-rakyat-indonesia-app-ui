import 'package:bri/mainApp/login_page.dart';
import 'package:bri/style/font_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController repeatPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Sign Up",
              style: appBarButtonBlue,
            ),
            SizedBox(
              width: 350.0,
              child: TextField(
                controller: email,
                decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.person_outline,
                      color: Color(0xFF014a94),
                    ),
                    hintText: 'Email',
                    border: UnderlineInputBorder()),
              ),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              width: 350.0,
              child: TextField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon:
                      const Icon(Icons.lock_outline, color: Color(0xFF014a94)),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.password,
                      color: Color(0xFF014a94),
                    ),
                  ),
                  hintText: 'Password',
                  border: const UnderlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              width: 350.0,
              child: TextField(
                controller: repeatPassword,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon:
                      const Icon(Icons.lock_outline, color: Color(0xFF014a94)),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.password,
                      color: Color(0xFF014a94),
                    ),
                  ),
                  hintText: 'Repeat Password',
                  border: const UnderlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: 350.0,
              height: 45.0,
              child: ElevatedButton(
                onPressed: () {
                  signUp();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: const Text('Sign Up'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Sudah punya akun?"),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  child: const Text("Sign in."),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future signUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email.text.trim(),
      password: password.text.trim(),
    );
  }
}
