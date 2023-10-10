import 'package:flutter/material.dart';

class NewsDetailsWidget extends StatelessWidget {
  const NewsDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ЭВОЛЮЦИЯ SEO: АДАПТАЦИЯ К ИЗМЕНЕНИЯМ'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '10.05.2023',
            style: TextStyle(color: Colors.grey),
          ),
          Image.network(
            'https://webstripe.ru/upload/resize_cache/webp/iblock/adf/l1wj3m728itvinqpxmexcy4npleflcx6/Frame-7.webp',
          ),
          const Text(
            'ЭВОЛЮЦИЯ SEO: АДАПТАЦИЯ К ИЗМЕНЕНИЯМ',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 21,
          ),
          const Text(
            'lorem*50',
          ),
        ],
      ),
    );
  }
}
