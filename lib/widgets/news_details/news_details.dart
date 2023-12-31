import 'package:flutter/material.dart';
import 'package:sibcode_test/domain/entity/news_answer.dart';

class NewsDetailsWidget extends StatelessWidget {
  const NewsDetailsWidget({
    Key? key,
    required this.news,
  }) : super(key: key);
  final News news;
  @override
  Widget build(BuildContext context) {
    final String description = news.description ?? '';
    return Scaffold(
      appBar: AppBar(title: Text(news.name)),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 19,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              news.date,
              style: const TextStyle(color: Colors.grey),
            ),
            Image.network(news.image),
            const SizedBox(height: 7),
            Text(
              news.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              description,
            ),
          ],
        ),
      ),
    );
  }
}
