import 'package:bri/catatan_keuangan/catatan_uang.dart';
import 'package:bri/catatan_keuangan/kategori_page.dart';
import 'package:bri/catatan_keuangan/service/list_data.dart';
import 'package:bri/style/font_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TambahCatatanMasuk extends StatelessWidget {
  TambahCatatanMasuk({Key? key}) : super(key: key);

  DateTime date = DateTime(2022);

  TextEditingController controllerJumlah = TextEditingController();
  TextEditingController controllerKategori = TextEditingController();
  TextEditingController controllerTanggal = TextEditingController();
  TextEditingController controllerPembayaran = TextEditingController();
  TextEditingController controllerNote = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Tambah Catatan",
          style: appBarButton,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Consumer2<CatatanKeuanganService, ListKategoriService>(
          builder: (context, catatan, kategori, _) => Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Colors.black12,
                        style: BorderStyle.solid,
                        width: 1.0),
                  ),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/jumlah-icon.png',
                      width: 35.0,
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: TextField(
                        controller: controllerJumlah,
                        decoration: const InputDecoration(
                          label: Text(
                            "Jumlah",
                            style: title,
                          ),
                          hintText: "Rp",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Colors.black12,
                        style: BorderStyle.solid,
                        width: 1.0),
                  ),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      // 'assets/icons/kategori-icon.png',
                      kategori.selectedIcon,
                      width: 40.0,
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: TextField(
                        readOnly: true,
                        decoration: const InputDecoration(
                          label: Text(
                            "Kategori",
                            style: title,
                          ),
                          hintText: "Pilih Kategori",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        controller: controllerKategori = TextEditingController(
                            text: kategori.selectedKategori),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => KategoriPage()));
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Colors.black12,
                        style: BorderStyle.solid,
                        width: 1.0),
                  ),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/tanggal-icon.png',
                      width: 35.0,
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: TextField(
                        readOnly: true,
                        controller: controllerTanggal =
                            TextEditingController(text: catatan.tanggalDipilih),
                        decoration: const InputDecoration(
                          label: Text(
                            "Tanggal",
                            style: title,
                          ),
                          hintText: 'Pilih Tanggal',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        onTap: () async {
                          DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: date,
                            firstDate: DateTime(1950),
                            lastDate: DateTime(2100),
                          );
                          if (newDate == null) {
                            return;
                          }
                          date = newDate;
                          String day = date.day.toString();
                          String month = date.month.toString();
                          String year = date.year.toString();
                          catatan.pickDate('$day-$month-$year');
                          debugPrint(catatan.tanggalDipilih);
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Colors.black12,
                        style: BorderStyle.solid,
                        width: 1.0),
                  ),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/debit-icon.png',
                      width: 35.0,
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          label: Text(
                            "Pembayaran",
                            style: title,
                          ),
                        ),
                        controller: controllerPembayaran =
                            TextEditingController(text: 'Debit'),
                        enabled: false,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Colors.black12,
                        style: BorderStyle.solid,
                        width: 1.0),
                  ),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/note-icon.png',
                      width: 35.0,
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: TextField(
                        controller: controllerNote,
                        decoration: const InputDecoration(
                          label: Text(
                            "Note",
                            style: title,
                          ),
                          hintText: "(Opsional)",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 245, 245, 245),
        padding: const EdgeInsets.all(15.0),
        child: Consumer2<CatatanKeuanganService, ListKategoriService>(
          builder: (context, catatan, kategori, _) => ElevatedButton(
            style: mainElevatedBtnStyle,
            onPressed: () {
              if (controllerJumlah.text == "" ||
                  controllerKategori.text == "" ||
                  controllerTanggal.text == "") {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Cek data kembali."),
                  ),
                );
                return;
              }
              catatan.buatCatatan(
                  icon: kategori.selectedIcon,
                  jumlah: controllerJumlah.text,
                  kategori: controllerKategori.text,
                  tanggal: controllerTanggal.text,
                  note: controllerNote.text);
              Navigator.pop(context);
            },
            child: const Text(
              "Simpan",
              style: appBarButton,
            ),
          ),
        ),
      ),
    );
  }
}
