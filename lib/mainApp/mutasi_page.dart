// import 'package:bri/dio/model/model_product.dart';
// import 'package:bri/dio/model/news_model.dart';
// import 'package:bri/dio/screen/card_screen.dart';
// import 'package:bri/dio/screen/news_screen.dart';
// import 'package:bri/dio/service/dio_service.dart';
// import 'package:bri/dio/service/news_service.dart';
// import 'package:dio/dio.dart';
// import 'package:provider/provider.dart';
import 'package:bri/dio/service/dio_service_user.dart';
import 'package:bri/dio/screen/card_user.dart';
import 'package:bri/dio/model/model_user.dart';
import 'package:bri/style/font_style.dart';
import 'package:flutter/material.dart';

class MutasiMenu extends StatefulWidget {
  const MutasiMenu({Key? key}) : super(key: key);

  @override
  State<MutasiMenu> createState() => _MutasiMenuState();
}

class _MutasiMenuState extends State<MutasiMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Mutasi', style: appBarButton),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FutureBuilder<List<Datum>?>(
            future: ApiService().getUser(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Datum> listUser = snapshot.data!;
                // tampilkan data
                return Expanded(
                  child: ListView.builder(
                      itemCount: listUser.length,
                      itemBuilder: (context, index) {
                        return UserCard(
                          user: listUser[index],
                        );
                      }),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
