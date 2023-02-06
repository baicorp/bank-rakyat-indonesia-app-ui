import 'package:bri/catatan_keuangan/service/list_data.dart';
import 'package:bri/mainApp/main_menu.dart';
import 'package:bri/notification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'mainApp/login_page.dart';
import 'shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initializeNotification();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var nama;

  getFromLocalStorage() async {
    final pref = await SharedPreferences.getInstance();
    nama = pref.getString("nama");
    setState(() {
      log = pref.getBool('log') ?? false;
    });
  }

  @override
  void initState() {
    getFromLocalStorage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CatatanKeuanganService>(
            create: (_) => CatatanKeuanganService()),
        ChangeNotifierProvider<ListKategoriService>(
            create: (_) => ListKategoriService()),
      ],
      child: MaterialApp(
        home: Scaffold(
          body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const MainPage(username: "Bagus Atok Illah");
              } else {
                //return log ? MainPage(username: nama) : LoginPage();
                return LoginPage();
              }
            },
          ),
        ),
      ),
    );
  }
}
