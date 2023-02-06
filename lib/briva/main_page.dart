import 'package:bri/briva/second.dart';
import 'package:bri/style/font_style.dart';
import 'package:flutter/material.dart';

class BrivaMainPage extends StatefulWidget {
  const BrivaMainPage({Key? key}) : super(key: key);

  @override
  State<BrivaMainPage> createState() => _MainPageState();
}

class _MainPageState extends State<BrivaMainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF018bf8),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
            ),
            color: Colors.white,
          ),
          title: const Text(
            'BRIVA',
            style: appBarButton,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              PembayaranTerakhir(),
              /*Expanded(
                  child: ListView.builder(
                    itemCount: boxModel.length,
                    itemBuilder: (context, index) {
                      return boxModel[index];
                    },
                  ),
                ),*/
              DaftarBriva(),
              SizedBox(height: 10.0),
            ],
          ),
        ),
        bottomNavigationBar: MainButton(text: 'Pembayaran Baru'),
      ),
    );
  }
}

class PembayaranTerakhir extends StatefulWidget {
  const PembayaranTerakhir({Key? key}) : super(key: key);

  @override
  State<PembayaranTerakhir> createState() => _PembayaranTerakhirState();
}

class _PembayaranTerakhirState extends State<PembayaranTerakhir> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Pembayaran Terakhir',
            style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
                color: Colors.blue),
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 5.0),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/icons/briva-icon.jpg',
                      width: 50.0,
                    ),
                    const Text('PT ABC', style: title),
                    Text(
                      '1220202002',
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        color: Colors.grey[500],
                        fontSize: 10.0,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 5.0),
              Container(
                margin: const EdgeInsets.only(right: 5.0),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/icons/briva-icon.jpg',
                      width: 50.0,
                    ),
                    const Text('PT Maju Indo', style: title),
                    Text(
                      '1220202324002',
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        color: Colors.grey[500],
                        fontSize: 10.0,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DaftarBriva extends StatelessWidget {
  const DaftarBriva({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 490.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400,
                offset: const Offset(0.0, 8.0),
                blurRadius: 10.0)
          ],
        ),
        margin: const EdgeInsets.only(top: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF014a94)),
                borderRadius: BorderRadius.circular(5.0),
                color: const Color(0xFFf0f0f0),
              ),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.info_outline,
                        color: Color(0xFF014a94),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        'Informasi',
                        style: TextStyle(
                            color: Color(0xFF014a94),
                            fontFamily: 'Rubik',
                            fontSize: 11.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  const Text(
                    'Silahkan gunakan fitur Dompet Digital untuk melakukan top up GoPay, OVO, DANA, LinkAja dan ShopeePay',
                    style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 11.0,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.2),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Daftar BRIVA',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: const Color(0xFFf0f0f0),
              ),
              child: const TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search,
                        color: Color(0xFF014a94), size: 25.0),
                    hintText: 'Cari Daftar',
                    border: InputBorder.none),
              ),
            ),
            const SizedBox(height: 30.0),
            const Center(
              child: Text(
                'Belum Ada Dafttar',
                //textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 14.0,
                ),
              ),
            )
          ],
        ));
  }
}

class MainButton extends StatelessWidget {
  final String text;
  const MainButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20.0),
      child: ElevatedButton(
        style: mainElevatedBtnStyle,
        onPressed: () {
          //createBox();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondPage()));
        },
        child: Text(
          text,
          style: appBarButton,
        ),
      ),
    );
  }
}
