// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators, prefer_null_aware_operators

import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  NewsModel({
    this.news,
    // this.total,
    // this.skip,
    // this.limit,
  });

  List<News>? news;
  // int? total;
  // int? skip;
  // int? limit;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        news: json["news"] == null
            ? null
            : List<News>.from(json["news"].map((x) => News.fromJson(x))),
        // total: json["total"] == null ? null : json["total"],
        // skip: json["skip"] == null ? null : json["skip"],
        // limit: json["limit"] == null ? null : json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "news": news == null
            ? null
            : List<dynamic>.from(news!.map((x) => x.toJson())),
        // "total": total == null ? null : total,
        // "skip": skip == null ? null : skip,
        // "limit": limit == null ? null : limit,
      };
}

class News {
  News({
    this.id,
    this.userId,
    this.newsTitle,
    this.newsContent,
    // this.discountPercentage,
    // this.rating,
    // this.stock,
    // this.brand,
    // this.category,
    // this.thumbnail,
    // this.images,
  });

  int? id;
  int? userId;
  String? newsTitle;
  String? newsContent;
  // double? discountPercentage;
  // double? rating;
  // int? stock;
  // String? brand;
  // String? category;
  // String? thumbnail;
  // List<String>? images;

  factory News.fromJson(Map<String, dynamic> json) => News(
        id: json["id"] == null ? null : json["id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        newsTitle: json["news_title"] == null ? null : json["news_title"],
        newsContent: json["news_content"] == null ? null : json["news_content"],
        // discountPercentage: json["discountPercentage"] == null
        //     ? null
        //     : json["discountPercentage"].toDouble(),
        // rating: json["rating"] == null ? null : json["rating"].toDouble(),
        // stock: json["stock"] == null ? null : json["stock"],
        // brand: json["brand"] == null ? null : json["brand"],
        // category: json["category"] == null ? null : json["category"],
        // thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
        // images: json["images"] == null
        //     ? null
        //     : List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "user_id": userId == null ? null : userId,
        "news_title": newsTitle == null ? null : newsTitle,
        "news_content": newsContent == null ? null : newsContent,
        // "discountPercentage":
        //     discountPercentage == null ? null : discountPercentage,
        // "rating": rating == null ? null : rating,
        // "stock": stock == null ? null : stock,
        // "brand": brand == null ? null : brand,
        // "category": category == null ? null : category,
        // "thumbnail": thumbnail == null ? null : thumbnail,
        // "images":
        //     images == null ? null : List<dynamic>.from(images!.map((x) => x)),
      };
}
