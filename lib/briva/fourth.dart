import 'package:bri/briva/main_page.dart';
import 'package:bri/style/font_style.dart';
import 'package:flutter/material.dart';

class FourthPage extends StatelessWidget {
  const FourthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBF1F6),
      body: Stack(
        children: [
          Container(
            height: 180.0,
            color: Colors.amber,
          ),
          Positioned(
            top: 100,
            left: 30,
            child: Container(
              width: 150,
              height: 150,
              color: Colors.green[300],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: const Color(0xFF018bf8),
              padding: const EdgeInsets.symmetric(vertical: 16.0)),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const BrivaMainPage()));
          },
          child: const Text(
            'OK',
            style: appBarButton,
          ),
        ),
      ),
    );
  }
}
