import 'package:flutter/material.dart';
import 'activity_page.dart';
import 'mutasi_page.dart';
import 'account_page.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  final String username;
  const MainPage({Key? key, required this.username}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: [
          HomeMenu(username: widget.username),
          const MutasiMenu(),
          const AktifitasMenu(),
          const AkunMenu(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Image.asset(
          'assets/icons/qris-icon.png',
          width: 32.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        currentIndex: index,
        onTap: (index) => setState(() => this.index = index),
        selectedItemColor: const Color(0xFF3392EE),
        unselectedItemColor: const Color(0xFFAFAFAF),
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_outlined),
            label: 'Mutasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.email_outlined),
            label: 'Aktifitas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity_outlined),
            label: 'Akun',
          ),
        ],
      ),
    );
  }
}
