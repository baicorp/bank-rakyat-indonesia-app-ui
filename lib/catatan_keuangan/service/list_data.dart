import 'package:flutter/material.dart';

class CatatanKeuanganService extends ChangeNotifier {
  int? selecetedIndex;
  String tanggal = 'Pilih Tanggal';
  String tanggalDipilih = "";

  List<Map<String, dynamic>> listCatatanKeuangan = [
    {
      'icon': 'assets/icons/belanja-icon.png',
      'kategori': 'Belanja',
      'note': 'PT Inklusi Keuangan Nusantara',
      'jumlah': '200.000',
      'tanggal': '13-05-2022',
    },
    {
      'icon': 'assets/icons/uang-keluar-icon.png',
      'kategori': 'Uang Keluar',
      'note': 'BANK BRI - 089327474328',
      'jumlah': '500.000',
      'tanggal': '13-06-2022',
    }
  ];

  void pickDate(String tanggal) {
    tanggalDipilih = tanggal;
    notifyListeners();
  }

  void buatCatatan(
      {icon,
      required String jumlah,
      required String kategori,
      required String tanggal,
      note}) {
    listCatatanKeuangan.add({
      'icon': icon,
      'kategori': kategori,
      'note': note,
      'jumlah': jumlah,
      'tanggal': tanggal,
    });
    notifyListeners();
  }

  void hapusCatatan(int index) {
    listCatatanKeuangan.removeAt(index);
  }

  void editCatatan(
      {required int index,
      required String icon,
      required String kategori,
      required String note}) {
    listCatatanKeuangan[index]['icon'] = icon;
    listCatatanKeuangan[index]['kategori'] = kategori;
    listCatatanKeuangan[index]['note'] = note;
    notifyListeners();
  }
}

class ListKategoriService extends ChangeNotifier {
  int? selecetedIndex;
  String selectedIcon = 'assets/icons/kategori-icon.png';
  String selectedKategori = "";

  CatatanKeuanganService catatan = CatatanKeuanganService();

  List<Map<String, dynamic>> listKategori = [
    {
      'icon': 'assets/icons/belanja-icon.png',
      'kategori': 'Belanja',
    },
    {
      'icon': 'assets/icons/uang-keluar-icon.png',
      'kategori': 'Uang Keluar',
    },
    {
      'icon': 'assets/icons/cicilan-icon.png',
      'kategori': 'Cicilan',
    },
    {
      'icon': 'assets/icons/dompet-digital-icon.png',
      'kategori': 'Dompet Digital',
    },
    {
      'icon': 'assets/icons/kesehatan-icon.png',
      'kategori': 'Kesehatan',
    },
  ];

  void setKategoriTambahCatatan(int index) {
    for (var i = 0; i < listKategori.length; i++) {
      if (index == i) {
        selectedIcon = listKategori[i]['icon'];
        selectedKategori = listKategori[i]['kategori'];
        notifyListeners();
        return;
      }
    }
  }
}
