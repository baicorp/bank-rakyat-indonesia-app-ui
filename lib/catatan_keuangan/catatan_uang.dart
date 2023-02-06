import 'package:bri/catatan_keuangan/buat_catatan.dart';
import 'package:bri/catatan_keuangan/detail_pengeluaran.dart';
import 'package:bri/catatan_keuangan/service/list_data.dart';
import 'package:bri/mainApp/main_menu.dart';
import 'package:bri/style/font_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatatanKeuangan extends StatelessWidget {
  const CatatanKeuangan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const MainPage(username: "Bagus Atok Illah"),
              ),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          "Catatan Keuangan",
          style: appBarButton,
        ),
        centerTitle: true,
      ),
      body: Consumer<CatatanKeuanganService>(
        builder: (context, catatan, child) => ListView.builder(
          itemCount: catatan.listCatatanKeuangan.length,
          itemBuilder: (context, index) {
            return ListCatatan(index: index);
          },
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(15.0),
        child: Consumer2<ListKategoriService, CatatanKeuanganService>(
          builder: (context, kategori, catatan, _) => ElevatedButton(
            style: mainElevatedBtnStyle,
            onPressed: () {
              kategori.selectedIcon = 'assets/icons/kategori-icon.png';
              kategori.selectedKategori = '';
              catatan.tanggalDipilih = '';
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TambahCatatanMasuk(),
                ),
              );
            },
            child: const Text(
              "Buat Catatan Baru",
              style: appBarButton,
            ),
          ),
        ),
      ),
    );
  }
}

class ListCatatan extends StatelessWidget {
  const ListCatatan({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<CatatanKeuanganService>(
      builder: (context, catatan, child) => GestureDetector(
        onTap: () {
          catatan.selecetedIndex = index;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DetailPengeluaran(),
            ),
          );
        },
        child: Container(
          color: Colors.white,
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10.0),
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    // "13 Juni 2022",
                    catatan.listCatatanKeuangan[index]['tanggal'],
                    style: titleBlue,
                  ),
                  Text(
                    // "-Rp.50.000",
                    "-Rp" + catatan.listCatatanKeuangan[index]['jumlah'],
                    style: titleBlue,
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListTile(
                      dense: true,
                      leading: Image.asset(
                        // 'assets/icons/belanja-icon.png',
                        catatan.listCatatanKeuangan[index]['icon'],
                        width: 45.0,
                      ),
                      title: Text(
                        // "Belanja",
                        catatan.listCatatanKeuangan[index]['kategori'],
                        style: title,
                      ),
                      subtitle: Text(
                        // "PT Inklusi Keuangan Nusantara.",
                        catatan.listCatatanKeuangan[index]['note'],
                        style: subtitleGrey,
                      ),
                    ),
                  ),
                  Text(
                    // "-Rp.50.000",
                    "-Rp" + catatan.listCatatanKeuangan[index]['jumlah'],
                    style: subtitleGrey,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
