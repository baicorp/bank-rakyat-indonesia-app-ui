import 'dart:developer';

// import 'package:bri/dio/model/model_product.dart';
import 'package:bri/dio/model/news_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

class NewsService {
  var dio = Dio();
  // Future<List<Product>?> getProducts() async {
  //   try {
  //     var url = 'https://dummyjson.com/products?limit=10';
  //     var response = await dio.get(url);
  //     if (response.statusCode == 200) {
  //       var _model = ProductsModel.fromJson(response.data);

  //       var listData = _model.products;
  //       return listData;
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }

  Future<List<News>?> getProductsOffline() async {
    try {
      var result = await _parseFileToJson('assets/news.json');

      if (result != null) {
        var listData = result.news;
        return listData;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<NewsModel> _parseFileToJson(String path) async {
    final string = await rootBundle.loadString(path);
    return newsModelFromJson(string);
  }
}
