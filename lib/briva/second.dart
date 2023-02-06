import 'package:bri/briva/third.dart';
import 'package:bri/style/font_style.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  SecondPage({Key? key}) : super(key: key);

  TextEditingController keyNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF018bf8),
        title: const Text(
          'BRIVA',
          style: appBarButton,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 620.0,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade400,
                      offset: const Offset(0.0, 8.0),
                      blurRadius: 10.0)
                ],
              ),
              padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Bayar BRIVA',
                    style: TextStyle(
                        fontFamily: 'Rubik',
                        color: Color(0xFF014a94),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/briva-icon.jpg',
                        width: 50.0,
                      ),
                      const SizedBox(width: 10.0),
                      Flexible(
                        child: TextField(
                          controller: keyNumber,
                          decoration: const InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: 'Nomor Tujuan',
                            hintText: 'Nomor BRIVA',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20.0),
        child: ElevatedButton(
          style: mainElevatedBtnStyle,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ThirdPage(brivaNumber: keyNumber.text)));
          },
          child: const Text(
            'Lanjutkan',
            style: appBarButton,
          ),
        ),
      ),
    );
  }
}
