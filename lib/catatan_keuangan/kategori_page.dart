import 'package:bri/catatan_keuangan/service/list_data.dart';
import 'package:bri/style/font_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KategoriPage extends StatelessWidget {
  KategoriPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kategori", style: appBarButton),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
            child: Text("Daftar Kategori", style: titleBlue),
          ),
          Consumer<ListKategoriService>(
            builder: (context, kategori, _) => Expanded(
              child: ListView.builder(
                itemCount: kategori.listKategori.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      kategori.setKategoriTambahCatatan(index);
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      margin: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                      decoration: const BoxDecoration(
                          border: Border(bottom: BorderSide())),
                      child: ListTile(
                        leading: Image.asset(
                          kategori.listKategori[index]['icon'],
                          width: 40,
                        ),
                        title: Text(
                          kategori.listKategori[index]['kategori'],
                          style: title,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
