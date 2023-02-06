import 'package:bri/catatan_keuangan/catatan_uang.dart';
import 'package:bri/catatan_keuangan/kategori_page.dart';
import 'package:bri/catatan_keuangan/service/list_data.dart';
import 'package:bri/style/font_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditCatatan extends StatelessWidget {
  EditCatatan({Key? key}) : super(key: key);

  TextEditingController controllerKategori = TextEditingController();
  TextEditingController controllerNote = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer2<CatatanKeuanganService, ListKategoriService>(
      builder: (context, catatan, kategori, _) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Edit",
            style: appBarButton,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
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
                        decoration: InputDecoration(
                          label: const Text(
                            'Jumlah',
                            style: title,
                          ),
                          hintText: "-Rp" +
                              catatan.listCatatanKeuangan[
                                  catatan.selecetedIndex!]['jumlah'],
                          enabled: false,
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
                      kategori.selectedIcon,
                      width: 35.0,
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: TextField(
                        readOnly: true,
                        controller: controllerKategori = TextEditingController(
                          text: kategori.selectedKategori,
                        ),
                        decoration: const InputDecoration(
                          label: Text(
                            "Kategori",
                            style: title,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => KategoriPage(),
                            ),
                          );
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
                        decoration: InputDecoration(
                          label: const Text(
                            "Tanggal",
                            style: title,
                          ),
                          hintText: catatan
                                  .listCatatanKeuangan[catatan.selecetedIndex!]
                              ['tanggal'],
                          enabled: false,
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
                      'assets/icons/pembayaran-icon.png',
                      width: 35.0,
                    ),
                    const SizedBox(width: 10.0),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          label: Text(
                            "Pembayaran",
                            style: title,
                          ),
                          hintText: "Debit",
                          enabled: false,
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
                      'assets/icons/note-icon.png',
                      width: 35.0,
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: TextField(
                        controller: controllerNote = TextEditingController(
                          text: catatan
                                  .listCatatanKeuangan[catatan.selecetedIndex!]
                              ['note'],
                        ),
                        decoration: const InputDecoration(
                          label: Text(
                            "Note",
                            style: title,
                          ),
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
        bottomNavigationBar: Container(
          color: const Color.fromARGB(255, 245, 245, 245),
          padding: const EdgeInsets.all(15.0),
          child: ElevatedButton(
            style: mainElevatedBtnStyle,
            onPressed: () {
              catatan.editCatatan(
                  index: catatan.selecetedIndex!,
                  icon: kategori.selectedIcon,
                  kategori: controllerKategori.text,
                  note: controllerNote.text);
              Navigator.pop(context);
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
