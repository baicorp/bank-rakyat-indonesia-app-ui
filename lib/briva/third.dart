import 'package:flutter/material.dart';

import '../style/font_style.dart';

class ThirdPage extends StatefulWidget {
  ThirdPage({Key? key, required this.brivaNumber}) : super(key: key);
  String? brivaNumber;

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF018bf8),
        title: const Text(
          'Tagihan',
          style: appBarButton,
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 380.0,
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
            decoration: const BoxDecoration(
              color: Color(0xFF018bf8),
            ),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 28.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Total Pembayaran',
                    style: subtitle,
                  ),
                  const SizedBox(height: 5.0),
                  const Text(
                    'Rp 1.200.000',
                    style: TextStyle(
                      color: Color(0xFF018bf8),
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Divider(
                    color: Color(0xFFd8edfe),
                    height: 40,
                    thickness: 2,
                  ),
                  Column(
                    children: [
                      Row(
                        children: const [
                          Text(
                            'Nominal Tagihan',
                            style: subtitle,
                          ),
                          SizedBox(width: 45.0),
                          Text(
                            'Rp 1.200.000',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF018bf8),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: const [
                          Text(
                            'Biaya Admin',
                            style: subtitle,
                          ),
                          SizedBox(width: 70.0),
                          Text(
                            'Rp 0',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF018bf8),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(
                    color: Color(0xFFd8edfe),
                    height: 40.0,
                    thickness: 2,
                  ),
                  Flexible(
                    child: GridView.count(
                      primary: false,
                      crossAxisCount: 2,
                      childAspectRatio: 5 / 2.4,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Institusi',
                              style: subtitle,
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              'PT Indonesia Makmur Abadi',
                              style: normal,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Nomor BRIVA',
                              style: subtitle,
                            ),
                            const SizedBox(height: 5.0),
                            Text(
                              widget.brivaNumber!,
                              style: normal,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Nama Pelanggan',
                              style: subtitle,
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              'Bagus Atok Illah',
                              style: normal,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Keterangan',
                              style: subtitle,
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              'Verifikasi nomor virtual Account berhasil!',
                              style: normal,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(25, 20, 25, 40),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sumber Dana',
                  style: TextStyle(
                      fontFamily: 'Rubik',
                      color: Color(0xFF014a94),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 10.0),
                Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFFe6e6e6),
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          color: const Color(0xFF018bf8),
                        ),
                        child: const Center(
                          child: Text(
                            'BI',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '0070 0101 5899 513',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text('Rp 10.200.000'),
                        ],
                      )
                    ],
                  ),
                ),
              ],
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
            Navigator.pop(context);
          },
          child: const Text(
            'Bayar',
            style: appBarButton,
          ),
        ),
      ),
    );
  }
}
