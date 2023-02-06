import 'package:bri/catatan_keuangan/catatan_uang.dart';
import 'package:bri/catatan_keuangan/edit_catatan.dart';
import 'package:bri/catatan_keuangan/service/list_data.dart';
import 'package:bri/style/font_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPengeluaran extends StatelessWidget {
  const DetailPengeluaran({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<CatatanKeuanganService, ListKategoriService>(
      builder: (context, catatan, kategori, _) => Scaffold(
        backgroundColor: const Color.fromARGB(255, 245, 245, 245),
        appBar: AppBar(
          title: const Text("Detail Pengeluaran", style: appBarButton),
          centerTitle: true,
          actions: [
            TextButton(
              onPressed: () {
                kategori.selectedIcon = catatan
                    .listCatatanKeuangan[catatan.selecetedIndex!]['icon'];
                kategori.selectedKategori = catatan
                    .listCatatanKeuangan[catatan.selecetedIndex!]['kategori'];
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditCatatan()));
              },
              child: const Text("Edit", style: textPutih),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: ListTile(
                leading: Image.asset(
                  // 'assets/icons/belanja-icon.png',
                  catatan.listCatatanKeuangan[catatan.selecetedIndex!]['icon'],
                  width: 45.0,
                ),
                // title: Text("Belanja", style: title),
                title: Text(
                    catatan.listCatatanKeuangan[catatan.selecetedIndex!]
                        ['kategori'],
                    style: titleBig),
                subtitle: Text(
                  // "PT Inklusi Keuangan Nusantara\n12698701253030650",
                  catatan.listCatatanKeuangan[catatan.selecetedIndex!]['note'],
                  style: subtitleGrey,
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Jumlah",
                    style: normal,
                  ),
                  Text(
                    // '-Rp500.0000',
                    '-Rp' +
                        catatan.listCatatanKeuangan[catatan.selecetedIndex!]
                            ['jumlah'],
                    style: titleBlue,
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Tanggal", style: normal),
                      // Text("13 Juni 2022", style: normal),
                      Text(
                        // "13 Juni 2022",
                        catatan.listCatatanKeuangan[catatan.selecetedIndex!]
                            ['tanggal'],
                        style: normal,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Pembayaran", style: normal),
                      Text("Debit", style: normal),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Waktu", style: normal),
                      Text("18:04:41", style: normal),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("No Ref", style: normal),
                      Text("452940074301", style: normal),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(15.0),
          child: ElevatedButton(
            style: mainElevatedBtnStyle,
            onPressed: () {
              catatan.hapusCatatan(catatan.selecetedIndex!);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CatatanKeuangan()));
            },
            child: const Text(
              "Hapus",
              style: appBarButton,
            ),
          ),
        ),
      ),
    );
  }
}
