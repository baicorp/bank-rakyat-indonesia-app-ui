import 'package:bri/dio/model/news_model.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key? key,
    required this.news,
  }) : super(key: key);

  final News news;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          news.newsTitle!,
          style: const TextStyle(color: Colors.black, fontSize: 16),
          maxLines: 2,
        ),
        const SizedBox(height: 10),
        Text(
          "${news.newsContent}",
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
