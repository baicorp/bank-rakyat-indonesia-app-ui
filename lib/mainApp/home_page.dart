import 'package:bri/catatan_keuangan/catatan_uang.dart';
import 'package:bri/style/font_style.dart';
import 'package:flutter/material.dart';

import '../briva/main_page.dart';

class HomeMenu extends StatelessWidget {
  String username;
  HomeMenu({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          'Home',
          style: TextStyle(
              fontSize: 18.0,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontFamily: 'Rubik'),
        ),
        centerTitle: true,
        actions: const [
          Icon(
            Icons.notifications_outlined,
            color: Colors.blue,
          ),
          SizedBox(
            width: 15.0,
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            width: 800.0,
            height: 380.0,
            color: Colors.blue,
          ),
          ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Halo, \n$username',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Saldo Rekening Utama',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  fontFamily: 'Rubik'
                                  //fontWeight: FontWeight.w200,
                                  ),
                            ),
                            Text(
                              'Rp. 20.000.000',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23.0,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        OutlinedButton(
                          style: smallOutlinedBtnStyle,
                          onPressed: () {},
                          child: const Text('Rekening Lain', style: textPutih),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CatatanKeuangan()));
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(47, 0, 0, 0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(22.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text(
                                    '0',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 50.0,
                                      fontFamily: 'Rubik',
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  Text('Pengeluaran', style: textPutih)
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 30.0,
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('Total Pemasukan', style: textPutih),
                                  Text('Rp0', style: textPutih),
                                  SizedBox(height: 13.0),
                                  Text('Total Pengeluaran', style: textPutih),
                                  Text('Rp20.000.000', style: textPutih),
                                  SizedBox(height: 13.0),
                                  Text('Selisih', style: textPutih),
                                  Text('Rp-20.000.000', style: textPutih),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFF555555),
                            blurRadius: 1, // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                child: SizedBox(
                                  width: 71,
                                  height: 76,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/icons/pulsa-icon.png',
                                          width: 40.0),
                                      const Text(
                                        'Pulsa/Data',
                                        style: normal,
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {},
                              ),
                              InkWell(
                                child: SizedBox(
                                  width: 71,
                                  height: 76,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          'assets/icons/transfer-icon.png',
                                          width: 40.0),
                                      const Text(
                                        'Transfer',
                                        style: normal,
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {},
                              ),
                              InkWell(
                                child: SizedBox(
                                  width: 71,
                                  height: 76,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          'assets/icons/dompet-icon.png',
                                          width: 40.0),
                                      const Text(
                                        'Dompet',
                                        style: normal,
                                      ),
                                      const Text(
                                        'Digital',
                                        style: normal,
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {},
                              ),
                              InkWell(
                                child: SizedBox(
                                  width: 71,
                                  height: 76,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          'assets/icons/brizzi-icon.png',
                                          width: 40.0),
                                      const Text('BRIZZI', style: normal),
                                    ],
                                  ),
                                ),
                                onTap: () {},
                              ),
                            ],
                          ),
                          const Divider(
                            color: Color(0xFF555555),
                            indent: 0,
                            endIndent: 0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                child: SizedBox(
                                  width: 71,
                                  height: 66,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Image.asset(
                                          'assets/icons/tarik-tunai-icon.png',
                                          width: 40.0),
                                      const Text('Tarik Tunai', style: normal),
                                    ],
                                  ),
                                ),
                                onTap: () {},
                              ),
                              InkWell(
                                child: SizedBox(
                                  width: 71,
                                  height: 66,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Image.asset(
                                          'assets/icons/briva-icon-colored.png',
                                          width: 40.0),
                                      const Text('BRIVA', style: normal),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const BrivaMainPage()));
                                },
                              ),
                              InkWell(
                                child: SizedBox(
                                  width: 71,
                                  height: 66,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Image.asset(
                                          'assets/icons/listrik-icon.png',
                                          width: 40.0),
                                      const Text('Listrik', style: normal),
                                    ],
                                  ),
                                ),
                                onTap: () {},
                              ),
                              InkWell(
                                child: SizedBox(
                                  width: 71,
                                  height: 66,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Image.asset(
                                          'assets/icons/lainnya-icon.png',
                                          width: 40.0),
                                      const Text('Lainnya', style: normal),
                                    ],
                                  ),
                                ),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Special Untukmu',
                          style: TextStyle(
                              fontFamily: 'Rubik',
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.blue),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Lihat Lebih',
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      //
      // Center(
      //   child: Text(
      //     'Menu Home\nHello, \n$username',
      //     style: const TextStyle(fontSize: 30.0),
      //   ),
      // ),
    );
  }
}
