import 'dart:developer';

import 'package:bri/dio/model/model_user.dart';
import 'package:dio/dio.dart';

class ApiService {
  var dio = Dio();
  Future<List<Datum>?> getUser() async {
    try {
      var url = 'https://reqres.in/api/users?page=2';
      var response = await dio.get(url);
      if (response.statusCode == 200) {
        var _model = Welcome.fromJson(response.data);

        var listData = _model.data;
        return listData;
      }
    } catch (e) {
      log(e.toString());
    }
  }
  // FutureBuilder<List<Product>?>(
  //   future: ApiService().getProductsOffline(),
  //   builder: (context, snapshot) {
  //     if (snapshot.hasData) {
  //       List<Product> listProducts = snapshot.data!;
  //       // tampilkan data
  //       return Expanded(
  //         child: ListView.builder(
  //             itemCount: listProducts.length,
  //             itemBuilder: (context, index) {
  //               return ProductCard(
  //                 product: listProducts[index],
  //               );
  //             }),
  //       );
  //     } else {
  //       return const Center(child: CircularProgressIndicator());
  //     }
  //   },
  // ),
  // FutureBuilder<List<News>?>(
  //   future: NewsService().getProductsOffline(),
  //   builder: (context, snapshot) {
  //     if (snapshot.hasData) {
  //       List<News> news = snapshot.data!;
  //       // tampilkan data
  //       return Expanded(
  //         child: ListView.builder(
  //             itemCount: news.length,
  //             itemBuilder: (context, index) {
  //               return NewsCard(
  //                 news: news[index],
  //               );
  //             }),
  //       );
  //     } else {
  //       return const Center(child: CircularProgressIndicator());
  //     }
  //   },
  // ),
}
